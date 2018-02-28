class UsersController < ApplicationController
  def dashboard
    @user = current_user
    @spaceships = Spaceships.all
    authorize @user
  end
end
