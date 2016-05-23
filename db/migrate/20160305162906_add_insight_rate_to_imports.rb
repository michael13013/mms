class AddInsightRateToImports < ActiveRecord::Migration
  def change
    add_column :imports, :total, :integer
    add_column :imports, :success_rate, :float
  end
end
