class AddNameToUseres < ActiveRecord::Migration[7.0]
  def change
    add_column :useres, :first_name, :string
    add_column :useres, :last_name, :string
  end
end
