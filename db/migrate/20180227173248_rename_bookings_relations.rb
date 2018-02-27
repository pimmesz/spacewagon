class RenameBookingsRelations < ActiveRecord::Migration[5.1]
  def change
    rename_column :bookings, :users_id, :user_id
    rename_column :bookings, :spaceships_id, :spaceship_id
  end
end
