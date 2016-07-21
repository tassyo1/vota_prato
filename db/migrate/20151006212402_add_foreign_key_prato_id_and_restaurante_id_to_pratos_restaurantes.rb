class AddForeignKeyPratoIdAndRestauranteIdToPratosRestaurantes < ActiveRecord::Migration
  def change
   	add_foreign_key :pratos_restaurantes, :pratos, column: :prato_id, primary_key: "id"
   	add_foreign_key :pratos_restaurantes, :restaurantes, column: :restaurante_id, primary_key: "id"
  end
end
