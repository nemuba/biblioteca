class Curso < ApplicationRecord
  paginates_per 5

  has_many :alunos
  has_many :livros
  has_many :materias

  belongs_to :semestre

  def self.search(search)
    where('descricao like ?', "%#{search}%").order(:descricao)
  end
end
