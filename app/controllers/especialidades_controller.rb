class EspecialidadesController < ApplicationController

  def index
    @especialidades = Especialidade.all.order(:nome)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @especialidades }
    end
  end

  def new
    @especialidade = Especialidade.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @especialidade }
    end
  end

  def create
    @especialidade = Especialidade.new(especialidade_params)

    respond_to do |format|
      if @especialidade.save
        flash[:success] = 'Especialidade criada com sucesso.'
        format.html { redirect_to action: "index" }
        format.xml  { render xml: @especialidade, status: :created, location: @especialidade }
      else
        format.html { render action: 'new' }
        format.xml  { render xml: @especialidade.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @especialidade = Especialidade.find(params[:id])

    respond_to do |format|
      if @especialidade.restaurantes.first.blank?
        @especialidade.destroy
        flash[:success] = 'Especialidade deletada com sucesso.'
        format.html { redirect_to(especialidades_url) }
        format.xml  { head :ok }
      else
        flash[:danger] = "Especialidade \"#{@especialidade.nome}\" não pode ser deletada,
        pois está vinculada a um restaurante"
        format.html { redirect_to(especialidades_url) }
        format.xml  { render xml: @especialidade.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @especialidade = Especialidade.find(params[:id])
  end

  def update
    @especialidade = Especialidade.find(params[:id])

    respond_to do |format|
      if @especialidade.update(especialidade_params)
        flash[:success] = 'Especialidade foi alterada.'
        format.html { redirect_to action: "index" }
        format.xml  { head :ok }
      else
        format.html { render action: 'edit' }
        format.xml  { render xml: @especialidade.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def especialidade_params
    params.require(:especialidade).permit(:nome)
  end
  
end
