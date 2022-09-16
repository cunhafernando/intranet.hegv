class Noticia < ApplicationRecord

    belongs_to :categoria
    belongs_to :user

    validates :titulo, presence: true, length: { minimum: 5}
    validates :content, presence: true, length: { minimum: 10}

    mount_uploader :arquivo, ArquivoUploader
    has_rich_text :content

    paginates_per 6

    scope :desc_order, -> { order(created_at: :desc)}
    scope :without_principais, -> (ids) { where("id NOT IN(#{ids})") if ids.present?}
    scope :filtro_por_categoria, -> (categoria) {where categoria_id: categoria.id if categoria.present?}
end
