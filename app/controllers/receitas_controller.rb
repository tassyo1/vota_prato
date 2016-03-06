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

  def create
    @receita = Receita.new(receitas_params)
    respond_to do |format|
      if @receita.save
        format.html { redirect_to(@receita) }
      else
        format.html { render action: 'new' } 
      end
    end
  end
 
  def edit
    @receita = Receita.find(params[:id])
  end


  private
  def receitas_params
    params.require(:receita).permit(:modo_preparo,:ingredientes,:prato_id)
  end
end
