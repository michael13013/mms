class AddBrandToProducts < ActiveRecord::Migration

  def change
    add_reference :products, :brand, index: true, foreign_key: true
    remove_column :products, :product_type, :string
    add_column :products, :category, :string
  end

end
