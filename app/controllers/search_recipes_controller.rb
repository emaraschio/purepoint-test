class SearchRecipesController < ApplicationController
  helper_method :current_query

  def index
    @recipes = []
    if params[:query]
      @recipes = Recipe.search(params[:query])
    end
  end

  private

  def current_query
    params[:query]
  end
end
