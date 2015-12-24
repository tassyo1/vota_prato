class ReceitasController < ApplicationController

	def show
		if params[:prato]
			@prato = Prato.find(params[:prato])
			@receitas = Receita.find(params[:prato]) #colocar o 
		end
	end
end
