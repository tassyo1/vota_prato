class RestaurantesController < ApplicationController
	def index
		#@restaurantes = Restaurante.order :nome
		#render "index"

		@restaurantes = Restaurante.order("nome").page(params['page']).per(10)
		
		respond_to do |format|
			format.html
			format.xml {render xml: @restaurantes}
			format.json {render json: @restaurantes}
		end
	end

	def show
		@restaurante = Restaurante.find(params[:id])
 
		respond_to do |format|
			format.html 
			format.json {render json: @restaurante}
			format.xml {render xml: @restaurante}
		end
	end

	def destroy
		@restaurante = Restaurante.find(params[:id])
		@restaurante.destroy

		redirect_to(action: "index")
	end

	def new
		@restaurante = Restaurante.new
	end

	def restaurante_params
		params.require(:restaurante).permit(:nome, :endereco, :especialidade, :foto,
                                        :especialidade_ids)
	end

	def create
		@restaurante = Restaurante.new(restaurante_params)

    respond_to do |format|
      if @restaurante.save
        flash[:success]= "Restaurante foi criado com sucesso."
        format.html {	redirect_to @restaurante }
      else
        flash[:danger]
			  format.html {  render :new }
      end	
    end
	end

	def edit
		@restaurante = Restaurante.find(params[:id])
	end

	def update
		@restaurante = Restaurante.find(params[:id])
		
		if @restaurante.update_attributes(restaurante_params)
			redirect_to(action: "show", id: @restaurante)
		else
			render action: "edit"
		end
	end

	def busca
		@restaurante = Restaurante.find_by nome: params[:nome]
		if @restaurante
			redirect_to(action: 'show', id: @restaurante)
		else
			flash[:notice] = "Restaurante não encontrado..."
			redirect_to :action => 'index'
		end
	end
end
