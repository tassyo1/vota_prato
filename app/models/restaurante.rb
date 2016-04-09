class Restaurante < ActiveRecord::Base
  validates :nome, presence: true
  validates :endereco, presence: true
  validates :especialidade, presence: true
#  validates_uniqueness_of :nome, message: " - nome já cadastrado"
#  validates_uniqueness_of :endereco, message: " - endereço já cadastrado"


 # validate :primeira_letra_deve_ser_maiuscula

  has_many :comentarios , as: :comentavel
	
'''
  private
  def primeira_letra_deve_ser_maiuscula
    errors.add(:nome," - a primeira letra deve ser maiúscula") unless nome =~  /[A-Z].*/

  end
  '''
  has_many :qualificacoes
  has_and_belongs_to_many :pratos

  has_attached_file :foto, styles: 
    { medium: "300x300>", thumb: "100x100>"}


  validates_attachment_content_type :foto, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
	
