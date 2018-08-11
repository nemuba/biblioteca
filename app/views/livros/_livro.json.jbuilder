json.extract! livro, :id, :autor, :titulo, :ano_publicacao, :curso_id, :semestre_id, :materia_id, :created_at, :updated_at
json.url livro_url(livro, format: :json)
