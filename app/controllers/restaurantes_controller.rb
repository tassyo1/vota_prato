class RestaurantesController < ApplicationController
	def index
		@restaurantes = Restaurante.order :nome
		render "index"
	end
end
