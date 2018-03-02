class SpaceshipsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    policy_scope(Spaceship)
    if params[:query].present?
      results = PgSearch.multisearch(params[:query])
      @spaceships = []
      results.each do |result|
        @spaceships << result.searchable
      end
    else
      @spaceships = Spaceship.order(created_at: :desc)
      @spaceships = Spaceship.where.not(latitude: nil, longitude: nil)
      @markers = @spaceships.map do |spaceship|
        {
          lat: spaceship.latitude,
          lng: spaceship.longitude#,
        }
      end
    end
  end

  def show
    @spaceship = Spaceship.find(params[:id])
    authorize @spaceship
    policy_scope(Spaceship)
    if params[:query].present?
      results = PgSearch.multisearch(params[:query])
    else
      @spaceships = Spaceship.order(created_at: :desc)
      @spaceships = Spaceship.where.not(latitude: nil, longitude: nil)
      @markers = @spaceships.map do |spaceship|
        {
          lat: @spaceship.latitude,
          lng: @spaceship.longitude
        }
      end
    end
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
        params.require(:spaceship).permit(:name, :photo, :photo_cache, :captain, :location, :speed, :capacity, :price_per_day)
      end
    end
