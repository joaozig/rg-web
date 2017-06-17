class Api::HighlightsController < ApplicationController

  # GET /api/highlights
  def index
    @highlights = Highlight.published.all.order(created_at: :desc)
    render json: @highlights.to_json(
      :methods => [:image_url],
      :include => {
        :posts => post_includes,
      	:category => category_includes,
        :place => place_includes,
        :franchise => franchise_includes,
        :restaurant => restaurant_includes
      }
    )
  end

private

  def post_includes
    {
      :methods => [:image_url],
      :include => {
        :restaurant => restaurant_includes,
        :place => place_includes,
        :franchise => franchise_includes
      }
    }
  end

  def category_includes
    {
      :methods => [:image_url],
      :include => {
        :franchises => franchise_includes
      }
    }
  end

  def place_includes
    {
      :methods => [:logo_url, :image_url],
      :include => {
        :neighborhood => {},
        :schedules => { :methods => [:day_of_week] },
        :restaurants => restaurant_includes
      }
    }
  end

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
      :include => [:neighborhood, :schedules, :franchise => {:methods => [:logo_url]}]
    }
  end
end
