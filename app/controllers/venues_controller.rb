class VenuesController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def show
    @venue = Venue.find(params[:id])
  end

end
