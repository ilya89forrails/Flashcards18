class AddEfactorToCard < ActiveRecord::Migration[5.2]
  def change
  	add_column :cards, :efactor, :float, default: 2.5
  end
end
