class Cms::RestaurantsController < Cms::CmsController
  before_action :set_franchise
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  # GET /franchises/:franchise_id/restaurants
  def index
    @restaurants = @franchise.restaurants.all.order(:name)
  end

  # GET /franchises/:franchise_id/restaurants/1
  def show
  end

  # GET /franchises/:franchise_id/restaurants/new
  def new
    @restaurant = Restaurant.new

    7.times do |i|
      i = i + 1
      i = 0 if i == 7
      @restaurant.schedules.build(day: i)
    end
  end

  # GET /franchises/:franchise_id/restaurants/1/edit
  def edit
  end

  # POST /franchises/franchise_id/restaurants
  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.franchise = @franchise

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to cms_franchise_restaurants_path, notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /franchises/:franchise_id/restaurants/1
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to cms_franchise_restaurants_path, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /franchises/:franchise_id/restaurants/1
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to cms_franchise_restaurants_path, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_franchise
      @franchise = Franchise.find(params[:franchise_id])
    end

    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.fetch(:restaurant, {}).permit(
        :name, :slogan, :address, :phone, :latitude, :longitude,
        :image, :neighborhood_id, info_ids: [], schedules_attributes: [:id, :day, :operating_hour])
    end
end
