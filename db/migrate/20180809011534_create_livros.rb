class CreateLivros < ActiveRecord::Migration[5.2]
  def change
    create_table :livros do |t|
      t.string :autor
      t.string :titulo
      t.date :ano_publicacao
      t.references :curso, foreign_key: true
      t.references :semestre, foreign_key: true
      t.references :materia, foreign_key: true

      t.timestamps
    end
  end
end
