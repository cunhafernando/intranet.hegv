class CreateJornais < ActiveRecord::Migration[7.0]
  def change
    create_table :jornais do |t|
      t.string :titulo
      t.string :materia

      t.timestamps
    end
  end
end
