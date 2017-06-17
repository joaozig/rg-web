class Api::PlacesController < ApplicationController

  # GET /api/places
  def index
    @places = Place.all.order(:name)
    render json: @places.to_json(
      :methods => [:logo_url, :image_url],
      :include => [
        :neighborhood,
        :schedules => { :methods => [:day_of_week] },
        :restaurants => restaurant_includes
      ]
    )
  end

private

  def restaurant_includes
    {
      :methods => [:image_url],
      :include => [:neighborhood, :franchise => {:methods => [:logo_url]}]
    }
  end
end
