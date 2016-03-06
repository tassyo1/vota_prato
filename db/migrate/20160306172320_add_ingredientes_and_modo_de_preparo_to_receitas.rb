class AddIngredientesAndModoDePreparoToReceitas < ActiveRecord::Migration
  def change
    add_column :receitas, :ingredientes, :text
    add_column :receitas, :modo_preparo, :text
  end
end
