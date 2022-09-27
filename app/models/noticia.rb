class Noticia < ApplicationRecord

    belongs_to :categoria
    belongs_to :user

    has_many :comentarios, dependent: :destroy

    validates :titulo, presence: true, length: { minimum: 5}
    validates :content, presence: true, length: { minimum: 10}

    mount_uploader :arquivo, ArquivoUploader
    has_rich_text :content

    paginates_per 6

    scope :desc_order, -> { order(created_at: :desc)}
    scope :without_principais, -> (ids) { where("id NOT IN(#{ids})") if ids.present? }
    scope :filtro_por_categoria, -> (categoria) { where categoria_id: categoria.id if categoria.present? }
    scope :filtro_por_arquivo, lambda { |month_year|
        if month_year
            date = Date.strptime( month_year, '%B %Y' )
            where created_at: date.beginning_of_month..date.end_of_month.next_day
        end
    }
end
