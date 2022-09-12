class Categoria < ApplicationRecord

    has_many :noticias
    validates :name, presence: true, length: { minimum: 3}
end
