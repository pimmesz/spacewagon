class AddCoordinatesToSpaceship < ActiveRecord::Migration[5.1]
  def change
    add_column :spaceships, :latitude, :float
    add_column :spaceships, :longitude, :float
  end
end
