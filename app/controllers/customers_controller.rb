require_relative '../views/customers_view'
require_relative '../models/customer'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customers_view = CustomersView.new
  end

  def list
    # get all the customers (REPO)
    customers = @customer_repository.all
    # display the customers (VIEW)
    @customers_view.display_list(customers)
  end

  def add
    # ask the user for the customer name (VIEW)
    name = @customers_view.ask_for("name")
    # ask the user for the customer price (VIEW)
    address = @customers_view.ask_for("address")
    # create an instance of customer (MODEL)
    customer = Customer.new(name: name, address: address)
    # save it (REPO)
    @customer_repository.create(customer)
  end
end
