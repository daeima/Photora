class VenuesController < ApplicationController
  # skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @venues = Venue.geocoded
    @markers = @venues.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude,
        info_window: render_to_string(partial: "info_window", locals: { venue: venue }),
      }
    end
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.user = current_user
    if @venue.save!
      redirect_to venue_path(@venue)
    else
      render :new
    end
  end

  def show
    @venue = Venue.find(params[:id])
    @review = Review.new(id: @venue)
    @booking = Booking.new

    @markers = [{
        lat: @venue.latitude,
        lng: @venue.longitude,
      }]
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :location, :description, :price, :user, photos: [])
  end
end
