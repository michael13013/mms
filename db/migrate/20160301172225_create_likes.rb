class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :product
      t.timestamps null: false
    end
  end
end
