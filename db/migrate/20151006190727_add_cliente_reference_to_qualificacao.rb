class AddClienteReferenceToQualificacao < ActiveRecord::Migration
  def change
  	add_foreign_key :qualificacoes, :clientes, column: :cliente_id, primary_key: "id"
  	add_foreign_key :qualificacoes, :restaurantes, column: :restaurante_id, primary_key: "id"
  end
end
