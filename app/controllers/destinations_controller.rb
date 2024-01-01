class DestinationsController < ApplicationController
  # before_action :set_destination, only: [:show, :edit, :update, :destroy]

  def index
    @destinations = Destination.all
    #line under is consuming the API that I built
    # @destinations = WeatherFacade.get_weather_from_api_i_built
  end

  def show
    @destination = Destination.find_by(id: params[:id])
    @weather = WeatherFacade.get_weather(@destination.lat,@destination.lon)
    @max_temp = WeatherFacade.max_temp(@destination.lat,@destination.lon)
    @min_temp = WeatherFacade.min_temp(@destination.lat,@destination.lon)
    @new_image_url = GifFacade.gifs(@weather[:current][:weather].first[:description])
  end

  def new
    @destination = Destination.new
  end

  def edit
  end

  def create
    @destination = Destination.new(destination_params)
    if @destination.save
      redirect_to @destination, notice: 'Destination was successfully created.'
    else
      render :new
    end
  end

  def update
    if @destination.update(destination_params)
      redirect_to @destination, notice: 'Destination was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @destination.destroy
    redirect_to destinations_path, notice: 'Destination was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_destination
    @destination = Destination.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def destination_params
    params.require(:destination).permit(:name, :zip, :description, :image_url)
  end
end
