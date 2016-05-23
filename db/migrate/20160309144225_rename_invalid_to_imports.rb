class RenameInvalidToImports < ActiveRecord::Migration
  def change
    rename_column :imports, :invalid, :rejected

  end
end
