class CreateSpaceships < ActiveRecord::Migration[5.1]
  def change
    create_table :spaceships do |t|
      t.string :location
      t.integer :speed
      t.integer :capacity
      t.string :captain
      t.integer :price_per_day
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
