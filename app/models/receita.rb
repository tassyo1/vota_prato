class Receita < ActiveRecord::Base
	validates_presence_of :conteudo, :message => " - deve ser preenchido"

	belongs_to :pratos

	validates_presence_of :prato_id
	validates_associated :pratos
end
