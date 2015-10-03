class CreateRestaurantes < ActiveRecord::Migration
  def change
    create_table :restaurantes do |t|
      t.string :nome, limit: 80
	  t.string :endereco
      t.timestamps null: false
      #pausa 7.10
    end
  end
end
