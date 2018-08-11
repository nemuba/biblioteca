class CreateCursos < ActiveRecord::Migration[5.2]
  def change
    create_table :cursos do |t|
      t.string :descricao
      t.integer :duracao
      t.string :periodo
      t.references :semestre, foreign_key: true

      t.timestamps
    end
  end
end
