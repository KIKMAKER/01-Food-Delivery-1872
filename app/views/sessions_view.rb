class SessionsView

  def ask_for(something)
    puts "What is your #{something}?"
    gets.chomp
  end

  def print_message(message)
    puts "#{message}."
  end
end
