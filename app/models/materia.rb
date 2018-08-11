class Materia < ApplicationRecord
  paginates_per 5

  has_many :livros
  belongs_to :curso

  def self.search(search)
    where('descricao like ?', "%#{search}%").order(:descricao)
  end
end
