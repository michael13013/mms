class AddInvalidToImports < ActiveRecord::Migration
  def change
    add_column :imports, :invalid, :integer
  end
end
