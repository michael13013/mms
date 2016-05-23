class AddLinkToProducts < ActiveRecord::Migration
  def change
    add_column :products, :link, :string
  end
end
