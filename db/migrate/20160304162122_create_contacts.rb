class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.text :subject
      t.string :email
      t.text :message

      t.timestamps null: false
    end
  end
end
