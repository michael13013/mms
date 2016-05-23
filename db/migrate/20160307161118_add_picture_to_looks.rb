class AddPictureToLooks < ActiveRecord::Migration
  def change
    add_column :looks, :photo, :string
  end
end
