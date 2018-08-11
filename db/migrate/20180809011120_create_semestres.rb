class CreateSemestres < ActiveRecord::Migration[5.2]
  def change
    create_table :semestres do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
