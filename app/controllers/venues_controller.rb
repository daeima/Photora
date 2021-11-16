class VenuesController < ApplicationController
  def index
  end

  def new
    Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      redirect_to venue_path(@venue)
    else
      render :new
    end
  end

  def show
    @venue = Venue.find(params[:id])
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :location, :description, :price, :user)
  end
end
