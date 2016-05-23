class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.references :product, index: true, foreign_key: true
      t.string :supplier
      t.decimal :price
      t.timestamps null: false
    end
  end
end
