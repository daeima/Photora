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
    @booking.user = current_user
    if @booking.save!
      redirect_to confirmation_path(@booking)
    else
      render :new
    end
  end

  def confirmation
    @booking = Booking.find(params[:id])
    @venue = @booking.venue
    @booking.total_price = (@booking.end_time.hour - @booking.start_time.hour) * @venue.price
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :total_price)
  end
end
