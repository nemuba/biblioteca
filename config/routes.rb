Rails.application.routes.draw do
  devise_for :usuarios
  root to: 'painel#index'

  resources :alunos
  resources :livros
  resources :materias
  resources :cursos
  resources :semestres
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
