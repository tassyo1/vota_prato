class AddForeignKeyEspecialidadesRestaurantes < ActiveRecord::Migration
  def change
    add_foreign_key :especialidades_restaurantes, :restaurantes, column: :restaurante_id, primary_key: "id"
    add_foreign_key :especialidades_restaurantes, :especialidades, column: :especialidade_id, primaty_key: "id"

  end
end
