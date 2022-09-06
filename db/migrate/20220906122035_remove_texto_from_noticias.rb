class RemoveTextoFromNoticias < ActiveRecord::Migration[7.0]
  def change
    remove_column :noticias, :texto, :text
  end
end
