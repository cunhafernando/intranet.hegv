class CreateRamais < ActiveRecord::Migration[7.0]
  def change
    create_table :ramais do |t|
      t.string :setor
      t.string :telefone
      t.string :email
      t.string :departamento

      t.timestamps
    end
  end
end
