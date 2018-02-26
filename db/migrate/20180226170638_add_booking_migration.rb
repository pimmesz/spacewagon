class AddBookingMigration < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :start_date, :datetime
    add_column :bookings, :end_date, :datetime
    add_reference :bookings, :spaceships, foreign_key: true
    add_reference :bookings, :users, foreign_key: true
  end
end
