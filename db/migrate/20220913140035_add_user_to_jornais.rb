class AddUserToJornais < ActiveRecord::Migration[7.0]
  def change
    add_reference :jornais, :user, null: false, foreign_key: true
  end
end
