require 'csv'
require_relative '../models/employee'

class EmployeeRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @employees = []
    load_csv if File.exist?(csv_file)
  end

  def all_riders
    # go through all the employees and select the ones where role is rider
    @employees.select do |employee|
      # set the condition on which to select employees
      # employee.role == "rider"
      employee.rider?
    end
  end

  def find(id)
    @employees.find do |employee|
      employee.id == id
    end
  end

  def find_by_username(username)
    @employees.find do |employee|
      employee.username == username
    end
  end



  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      # convert the data types
      row[:id] = row[:id].to_i
      employee = Employee.new(row)
      @employees << employee
    end
  end
end
