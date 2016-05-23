class AddSizeToOffers < ActiveRecord::Migration
  def change
    remove_column :products, :size, :string
    add_column :offers, :size, :string
  end
end
