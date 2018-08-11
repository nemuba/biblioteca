class Livro < ApplicationRecord
  belongs_to :curso
  belongs_to :semestre
  belongs_to :materia
end
