class Noticia < ApplicationRecord
    mount_uploader :arquivo, ArquivoUploader
    has_rich_text :content
end
