class RemoveLinkFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :link, :string
    add_column :offers, :link, :string
  end
end
