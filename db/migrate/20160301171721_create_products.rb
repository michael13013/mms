class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :size
      t.string :color
      t.string :product_type
      t.timestamps null: false
    end
  end
end
