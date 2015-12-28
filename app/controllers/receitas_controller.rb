class ReceitasController < ApplicationController

	def show
		if params[:prato]
			@prato = Prato.find(params[:prato])

			if @prato.receita
				@receitas = Receita.find(@prato.receita.id) #colocar o 
			end
		end
	end

	
end
