class Qualificacao < ActiveRecord::Base
	belongs_to :restaurante
	belongs_to :cliente	

	validates_presence_of :nota,  :message => " - deve ser preenchido"
	validates_presence_of :valor_gasto,  :message => " - deve ser preenchido"
	validates_numericality_of :nota, greater_than_or_equal_to:0, less_than_or_equal_to: 10, :message => " - deve ser um número entre 0 e 10"
	validates_numericality_of :valor_gasto, greater_than:0, :message => " - deve ser um valor maior que 0"


	validates_presence_of :cliente_id, :message => " - deve ser preenchido"
	 validates_presence_of :restaurante_id , :message => " - deve ser preenchido"	
	validates_associated :cliente, :restaurante

end	
