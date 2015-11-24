Rails.application.routes.draw do
  resources :comentarios
  
  VotaPrato::Application.routes.draw do
    resources :comentarios
  end

  resources :qualificacoes
  resources :clientes
  resources :restaurantes


  root to: 'pages#index'
end
