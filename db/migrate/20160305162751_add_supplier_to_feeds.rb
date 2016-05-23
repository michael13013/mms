class AddSupplierToFeeds < ActiveRecord::Migration
  def change
    add_column :feeds, :supplier, :string
  end
end
