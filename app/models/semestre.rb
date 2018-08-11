class Semestre < ApplicationRecord
  paginates_per 5

  def self.search(search)
    where('descricao like ?', "%#{search}%").order(:descricao)
  end
end
