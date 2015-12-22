class AddColumnDescricaoToPrato < ActiveRecord::Migration
  def change
    add_column :pratos, :descricao, :string, limit: 80
  end
end
