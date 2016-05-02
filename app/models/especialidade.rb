class Especialidade < ActiveRecord::Base
  validates :nome, presence: true
  validates_uniqueness_of :nome, case_sensitive: false

  has_and_belongs_to_many :restaurantes
   
end
