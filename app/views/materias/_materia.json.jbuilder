json.extract! materia, :id, :descricao, :carga_horaria, :curso_id, :created_at, :updated_at
json.url materia_url(materia, format: :json)
