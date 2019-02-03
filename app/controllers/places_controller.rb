class PlacesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :delete]
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
    current_user.places.create(place_params)
    redirect_to root_path
  end


  def show
    @place = Place.find(params[:id])
  end

  def edit
    @place = Place.find(params[:id])

    if @place.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end

  end


  def update #how do I know this is the code that will be used when update button is pressed?
    @place = Place.find(params[:id])
    
    if @place.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end



    @place.update_attributes(place_params)

    redirect_to root_path
  end


  def delete
    @place = Place.find(params[:id])

    if @place.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
    

    @place.destroy

    redirect_to root_path
  end


  private

  def place_params #pulls values
    params.require(:place).permit(:name, :description, :address)
  end





end
