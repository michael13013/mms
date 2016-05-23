class CreateImports < ActiveRecord::Migration
  def change
    create_table :imports do |t|
      t.time :started_at
      t.time :finished_at
      t.integer :status
      t.references :feed, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
