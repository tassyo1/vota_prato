class PratosController < ApplicationController
	def index
		@pratos = Prato.all
	end

	def new
		@prato = Prato.new
		@prato.receita = Receita.new
	end

	def create
		@prato = Prato.new(pratos_params)

		

		if @prato.save
			redirect_to(controller: "receitas", action: "show", prato: @prato)
		else
			render action: "new"
		end		
	end

	def pratos_params
		params.require(:prato).permit(:nome, :descricao, :receita)
	end
end
