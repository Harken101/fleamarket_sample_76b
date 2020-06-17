class CategoriesController < ApplicationController
  def new
    @children = Category.find(params[:parent_id]).children
    # binding.pry
    respond_to do |format|
      format.html
      format.json
    end
  end
end
