class SpaceshipsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
  end

  def show
    @spaceship = Spaceship.find(params[:id])
  end

  def new
    @spaceship = Spaceship.new
  end

  def create
    @spaceship = Spaceship.new(spaceship_params)
    if @spaceship.save
      redirect_to spaceship_path
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

  private

  def spaceship_params
    params.require(:spaceship).permit(:name, :photo, :captain, :location, :speed, :capacity, :price_per_day)
  end
end

