class BookingsController < ApplicationController
  def show
  end

  def new
    @booking = Booking.new
    @spaceship = Spaceship.find(params[:spaceship_id])
    authorize @spaceship
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    start_date = booking_params[:start_date][0..9]
    end_date = booking_params[:start_date][-10..-1]
    @booking.start_date = start_date
    @booking.end_date = end_date
    @spaceship = Spaceship.find(params[:spaceship_id])
    @booking.spaceship = Spaceship.find(params[:spaceship_id])
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to dashboard_path
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
