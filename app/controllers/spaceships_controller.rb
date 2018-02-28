class SpaceshipsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @spaceships = policy_scope(Spaceship).order(created_at: :desc)

    @markers = @spaceships.map do |spaceship|
      {
        lat: spaceship.latitude,
        lng: spaceship.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
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
    @spaceship = Spaceship.find(params[:id])
    authorize @spaceship
  end

  def update
    @spaceship = Spaceship.find(params[:id])
    authorize @spaceship
    @spaceship.update(spaceship_params)
    redirect_to spaceship_path(@spaceship)
  end

  def destroy
    @spaceship = Spaceship.find(params[:id])
    authorize @spaceship
  end

  private

  def spaceship_params
    params.require(:spaceship).permit(:name, :photo, :captain, :location, :speed, :capacity, :price_per_day)
  end
end
