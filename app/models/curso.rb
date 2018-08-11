class Curso < ApplicationRecord
  has_many :alunos
  has_many :livros
  has_many :materias
  belongs_to :semestre
end
