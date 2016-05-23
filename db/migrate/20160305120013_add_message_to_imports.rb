class AddMessageToImports < ActiveRecord::Migration
  def change
    add_column :imports, :message, :text
  end
end
