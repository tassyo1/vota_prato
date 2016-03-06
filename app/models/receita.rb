class Receita < ActiveRecord::Base
  validates :ingredientes, presence: true 
  validates :modo_preparo, presence: true
  validates :prato_id, presence: true 
	validates_associated :prato

  belongs_to :prato, :foreign_key => "prato_id"

end
