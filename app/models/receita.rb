class Receita < ActiveRecord::Base
  validates :conteudo, presence: true 
  validates :prato_id, presence: true 
	validates_associated :prato

  belongs_to :prato, :foreign_key => "prato_id"

end
