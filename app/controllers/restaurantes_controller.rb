class RestaurantesController < ApplicationController
	def index
		@restaurantes = Restaurante.order :nome
		render "index"
	end

	def show
		@restaurante = Restaurante.find(params[:id])
	end
end
