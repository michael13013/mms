class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.string :image
      t.string :name
      t.text :description
      t.references :user, index: true, foreign_key: true
      t.references :look, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
