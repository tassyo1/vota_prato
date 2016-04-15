class Especialidade < ActiveRecord::Base
  validates :nome, presence: true
  has_and_belongs_to_many :restaurantes
end
