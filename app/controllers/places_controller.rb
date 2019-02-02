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




end
