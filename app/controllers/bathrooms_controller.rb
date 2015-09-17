class BathroomsController < ApplicationController
  def index
    @bathrooms = Bathroom.all
  end

  def show
    @bathroom = Bathroom.find(params[:id])
    @reviews = @bathroom.reviews
  end

  def new
    @bathroom = Bathroom.new
  end

  def create
    @bathroom = Bathroom.new(bathroom_params)

    if @bathroom.save
      redirect_to bathrooms_path
    else
      flash[:errors] = @bathroom.errors.full_messages.join(". ")
      render :new
    end
  end



  protected
  def bathroom_params
    params.require(:bathroom).permit(:location_name, :address, :city, :state, :zip, :description)
  end
end
