class RemoveEspecialidadeFromRestaurantes < ActiveRecord::Migration
  def change
    remove_column :restaurantes, :especialidade, :string
  end
end
