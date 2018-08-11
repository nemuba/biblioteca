class Materia < ApplicationRecord
  has_many :livros
  belongs_to :curso
end
