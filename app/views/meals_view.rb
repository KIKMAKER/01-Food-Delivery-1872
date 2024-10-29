class MealsView
  def display_list(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}. #{meal.name} for R#{meal.price}"
    end
  end

  def ask_for(something)
    puts "What is the meal #{something}?"
    return gets.chomp
  end
end
