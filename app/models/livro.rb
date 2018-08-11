class Livro < ApplicationRecord
  paginates_per 5

  belongs_to :curso
  belongs_to :semestre
  belongs_to :materia

  def self.search(search)
    where('titulo like ?', "%#{search}%").order(:titulo)
  end
end
