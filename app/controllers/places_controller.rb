class PlacesController < ApplicationController

  def index
    @places = Place.all
    # @places = Place.page(params[:page]) -- TRIED TO PAGINATE -- NOT WORKING
    #all places in database stuffed into var @places
  end

  def new
    @place = Place.new #telling the application what I'm building the form for
  end #for the form so people can add in a "new" place

  # def index
  #   @tasks = Task.search(params[:term], params[:page])
  # end

  def create #sends values to database -- same as .create we used on the console 
    Place.create(place_params)
    redirect_to root_path
  end

  private

  def place_params #pulls values
    params.require(:place).permit(:name, :description, :address)
  end





end
