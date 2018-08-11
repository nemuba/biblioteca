class CreateMaterias < ActiveRecord::Migration[5.2]
  def change
    create_table :materias do |t|
      t.string :descricao
      t.integer :carga_horaria
      t.references :curso, foreign_key: true

      t.timestamps
    end
  end
end
