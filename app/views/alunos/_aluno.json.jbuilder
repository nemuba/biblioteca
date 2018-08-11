json.extract! aluno, :id, :nome, :ra, :email, :curso_id, :created_at, :updated_at
json.url aluno_url(aluno, format: :json)
