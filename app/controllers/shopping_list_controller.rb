class ShoppingListController < ApplicationController
  before_action :authenticate_user!
  include ShoppingListHelper

  def index
    @recipes = Recipe.includes(:user).where(user_id: current_user.id)
    @foods = foods_join
    @total_price = 0
    @recipes.each do |recipe|
      @total_price += recipe.total_price
    end
  end
end
