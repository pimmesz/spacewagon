class SpaceshipsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @spaceships = policy_scope(Spaceship).order(created_at: :desc)
  end

  def show
    @spaceship = Spaceship.find(params[:id])
    authorize @spaceship
  end

  def new
    @spaceship = Spaceship.new
    authorize @spaceship
  end

  def create
    @spaceship = Spaceship.new(spaceship_params)
    @spaceship.user = current_user
    if @spaceship.save
      redirect_to spaceship_path(@spaceship)
    else
      render :new
    end
    authorize @spaceship
  end

  def edit
    authorize @spaceship
  end

  def update
    authorize @spaceship
  end

  def destroy
    authorize @spaceship
  end

  private

  def spaceship_params
    params.require(:spaceship).permit(:name, :photo, :captain, :location, :speed, :capacity, :price_per_day)
  end
end

