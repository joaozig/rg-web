class Api::CategoriesController < ApplicationController

  # GET /api/categories
  def index
    @categories = Category.all.order(:name)
    render json: @categories.to_json(
      :methods => [:image_url],
      :include => {
        :franchises => franchise_includes
      }
    )
  end

private

  def franchise_includes
    {
      :methods => [:logo_url, :image_url],
      :include => {
        :restaurants => restaurant_includes
      }
    }
  end

  def restaurant_includes
    {
      :methods => [:image_url],
      :include => [:neighborhood, :franchise => {:methods => [:logo_url]}]
    }
  end
end
