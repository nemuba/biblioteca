class Aluno < ApplicationRecord
  paginates_per 5
  belongs_to :curso

  def self.search(search)
    where('nome like ?', "%#{search}%").order(:nome)
  end
end
