class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|

      t.timestamps
    end
  end
end
