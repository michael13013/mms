class AddLookRefToBrands < ActiveRecord::Migration
  def change
    add_reference :brands, :look, index: true, foreign_key: true
  end
end
