class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :restaurantes, :especialidades do |t|
      t.index [:restaurante_id, :especialidade_id], name:'rest_espc'
      t.index [:especialidade_id, :restaurante_id], name:'espc_resp'
    end
  end
end
