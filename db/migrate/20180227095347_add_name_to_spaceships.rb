class AddNameToSpaceships < ActiveRecord::Migration[5.1]
  def change
    add_column :spaceships, :name, :string
  end
end
