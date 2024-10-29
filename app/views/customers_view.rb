class CustomersView
  def display_list(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1}. #{customer.name} in #{customer.address}"
    end
  end

  def ask_for(something)
    puts "What is the customer #{something}?"
    return gets.chomp
  end
end
