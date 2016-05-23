class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :url
      t.integer :type

      t.timestamps null: false
    end
  end
end
