class AddPhotoToSpaceships < ActiveRecord::Migration[5.1]
  def change
    add_column :spaceships, :photo, :string
  end
end
