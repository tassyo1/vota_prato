class Comentario < ActiveRecord::Base
  validates :conteudo, length: { in: 3..20 }
  belongs_to :comentavel, polymorphic: true
end
