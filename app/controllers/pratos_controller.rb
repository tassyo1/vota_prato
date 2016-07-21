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


  def edit
    @prato = Prato.find(params[:id])
  end

  def update
    @prato = Prato.find(params[:id])

    respond_to do |format|
      if @prato.update(pratos_params)
        flash[:notice] = 'ModelClassName was successfully updated.'
        format.html { redirect_to(action:"index") }
        format.xml  { head :ok }
      else
        format.html { render action: 'edit' }
        format.xml  { render xml: @prato.errors, status: :unprocessable_entity }
      end
    end
  end
  private
	def pratos_params
		params.require(:prato).permit(:nome, :descricao)
	end

end
