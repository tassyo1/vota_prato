Rails.application.routes.draw do
  root  'pages#index'
  resources :comentarios
  resources :qualificacoes
  resources :clientes
  resources :restaurantes
  resources :receitas
  resources :pratos
 

 match 'rack',
	 :to => proc{|env| [200, {"Content-Type" => "text/html"}, ["App Rack numa rota Rails"]]}, via:'get'

end
