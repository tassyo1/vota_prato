class Prato < ActiveRecord::Base
	validates :descricao, presence: true
  validates :nome, presence: true
  validates_uniqueness_of :nome, case_sensitive: false 

	#has_and_belongs_to_many :restaurantes
	has_one :receita , autosave: true
	accepts_nested_attributes_for :receita

	'''validate :validate_presence_of_more_than_one_restaurante
	private
	def validate_presence_of_more_than_one_restaurante
		errors.add("restaurantes", 
			"deve haver ao menos um restaurante") if restaurantes.empty?
	end'''

	has_attached_file :foto, style: {
		medium:"300x300>", thumb: "100x100>"
	}

	validates_attachment_content_type :foto, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
