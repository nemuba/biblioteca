class CreateAlunos < ActiveRecord::Migration[5.2]
  def change
    create_table :alunos do |t|
      t.string :nome
      t.string :ra
      t.string :email
      t.references :curso, foreign_key: true

      t.timestamps
    end
  end
end
