class Employee
  attr_reader :id, :username, :password

  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
  end

  def rider?
    @role == "rider"
  end

end
