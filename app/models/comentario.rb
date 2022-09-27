class Comentario < ApplicationRecord
  belongs_to :noticia
  belongs_to :user

  validates :body, presence: true
end
