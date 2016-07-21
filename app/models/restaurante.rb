class Restaurante < ActiveRecord::Base
  include Capitalization
  before_save :chama_maiuscula
  validates :nome, presence: true
  validates :endereco, presence: true
  validates :especialidades, presence: true
  validates_uniqueness_of :nome, case_sensitive: false
  validates_uniqueness_of :endereco, case_sensitive: false

  has_many :comentarios , as: :comentavel
  has_many :qualificacoes
  has_and_belongs_to_many :pratos
  has_and_belongs_to_many :especialidades

#  validate :primeira_letra_deve_ser_maiuscula
#  private
#  def primeira_letra_deve_ser_maiuscula
#    errors.add(:nome," - a primeira letra deve ser maiúscula") unless nome =~  /[A-Z].*/
#  end

 
  has_attached_file :foto, styles: 
    { medium: "300x300>", thumb: "100x100>"}


  validates_attachment_content_type :foto, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  
  def chama_maiuscula
    self.nome =maiuscula(self.nome)
    self.endereco =maiuscula(self.endereco)
  end

end
	
