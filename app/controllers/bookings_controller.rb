class BookingsController < ApplicationController
  def new
    @venue = Venue.find(params[:venue_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    # we need `restaurant_id` to associate review with corresponding restaurant
    @venue = Venue.find(params[:venue_id])
    @booking.venue = @venue
    @booking.save
    redirect_to venues_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :total_price)
  end
end
