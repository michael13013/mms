class AddAdapterToFeeds < ActiveRecord::Migration
  def change
    add_column :feeds, :adapter, :string
  end
end
