class PlacesController < ApplicationController

  def index
    @places = Place.all
    # @places = Place.page(params[:page]) -- TRIED TO PAGINATE -- NOT WORKING
    #all places in database stuffed into var @places
  end


  # def index
  #   @tasks = Task.search(params[:term], params[:page])
  # end




end
