require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @sessions_view = SessionsView.new
  end


  def login
    # ask for the username (VIEW)
    username = @sessions_view.ask_for("username")
    # ask for the password (VIEW)
    password = @sessions_view.ask_for("password")
    # find the user by the username (REPO)
    employee = @employee_repository.find_by_username(username)
    # if the user exisits && the password matches
    if employee && employee.password == password
      # print successful login message (VIEW)
      @sessions_view.print_message("You have successfully logged in")
      return employee
    else
      # print error message (VIEW)
      @sessions_view.print_message("Wrong credentials, try again")
      login
    end

  end
end
