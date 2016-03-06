class ReceitasController < ApplicationController
  def new
    @receita = Receita.new(prato_id: params[:prato_id])
  end

	def show
	  @receita = Receita.find(params[:id])

	  respond_to do |format|
	    format.html # show.html.erb
	    format.xml  { render xml: @receita }
	  end
	end
'''
  def create
    @receita = @prato.receita
    
    if @receita.save
      redirect_to(controller: "receitas", action: "show", prato: @prato)
    else
      @prato.destroy
 #   redirect_to controller: "pratos", action: "new"
    end
  end
'''


  private
  def receitas_params
    params.require(:receita).permit(:conteudo,:prato_id)
  end
end
