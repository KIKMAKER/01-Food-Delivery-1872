require_relative '../views/meals_view'
require_relative '../models/meal'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meals_view = MealsView.new
  end

  def list
    # get all the meals (REPO)
    meals = @meal_repository.all
    # display the meals (VIEW)
    @meals_view.display_list(meals)
  end

  def add
    # ask the user for the meal name (VIEW)
    name = @meals_view.ask_for("name")
    # ask the user for the meal price (VIEW)
    price = @meals_view.ask_for("price").to_i
    # create an instance of meal (MODEL)
    meal = Meal.new(name: name, price: price)
    # save it (REPO)
    @meal_repository.create(meal)
  end
end
