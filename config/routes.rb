Rails.application.routes.draw do
  resources :comentarios
  
  VotaPrato::Application.routes.draw do
    resources :comentarios
  end

  resources :qualificacoes
  resources :clientes
  resources :restaurantes
  match 'busca' => 'restaurantes#busca', via: 'get' #rota e action criadas apenas para teste de controller restaurante

  root to: 'pages#index'

  match 'rack',
	 :to => proc{|env| [200, {"Content-Type" => "text/html"}, ["App Rack numa rota Rails"]]}, via:'get'

  match 'pratos' => 'pratos#index', via: 'get'
  #match 'pratos', controller: 'pratos', action: 'index', via: 'get' ----outra sintaxe


end
