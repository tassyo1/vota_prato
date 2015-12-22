class PratosController < ApplicationController
	def index
		@pratos = Prato.all
	end
end
