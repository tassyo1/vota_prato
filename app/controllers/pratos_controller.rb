class PratosController < ApplicationController
	def index
		@pratos = Prato.all
	end

	def new
		@pratos = Prato.new
	end
end
