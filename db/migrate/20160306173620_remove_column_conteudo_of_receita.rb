class RemoveColumnConteudoOfReceita < ActiveRecord::Migration
  def change
    remove_column :receitas, :conteudo
  end
end
