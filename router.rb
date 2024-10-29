# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run
    while @running
      @current_user = @sessions_controller.login
      while @current_user
        if @current_user.rider?
          display_rider_menu
          action = gets.chomp.to_i
          dispatch_rider(action)
        else
          display_manager_menu
          action = gets.chomp.to_i
          dispatch_manager(action)
        end
      end
    end
  end

  def display_manager_menu
    puts "What would you like to do?"
    puts "1 - Add a meal"
    puts "2 - List all meals"
    puts "3 - Add a customer"
    puts "4 - List all customers"
    puts "5 - Other manager stuff"
    puts "8 - Logout"
    puts "9 - Quit"
  end

  def display_rider_menu
    puts "What would you like to do?"
    puts "1 - Mark an order as delivered"
    puts "2 - List all undelivered orders"
    puts "8 - Logout"
    puts "9 - Quit"
  end

  def dispatch_manager(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 8 then logout
    when 9 then quit
    end
  end

  def dispatch_rider(action)
    case action
    when 1 then "something somewhere for a rider"
    when 8 then logout
    when 9 then quit
    end
  end

  def logout
    @current_user = nil
  end

  def quit
    @current_user = nil
    @running = false
  end
end
