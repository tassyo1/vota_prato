class PratosController < ApplicationController
	def index
		@pratos = Prato.all
	end

	def new
		@prato = Prato.new
	end

	def create
		@prato = Prato.new(pratos_params)
		if @prato.save 
     # redirect_to(action: "show", id: @prato)
       redirect_to(action: "index")
		else
			render action: "new"
    end
	end

  private
	def pratos_params
		params.require(:prato).permit(:nome, :descricao)
	end

end
