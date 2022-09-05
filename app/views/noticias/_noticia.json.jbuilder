json.extract! noticia, :id, :titulo, :texto, :arquivo, :created_at, :updated_at
json.url noticia_url(noticia, format: :json)
