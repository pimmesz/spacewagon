class BookingsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    # set spaceship id
    # set current_user id to be booking's user id

    if @booking.save
      redirect_to booking_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
