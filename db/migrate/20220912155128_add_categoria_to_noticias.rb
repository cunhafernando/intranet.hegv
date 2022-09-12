class AddCategoriaToNoticias < ActiveRecord::Migration[7.0]
  def change
    add_reference :noticias, :categoria, null: false, foreign_key: true
  end
end
