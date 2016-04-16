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
        flash[:notice] = 'ModelClassName was successfully created.'
        format.html { redirect_to(@especialidade) }
        format.xml  { render xml: @especialidade, status: :created, location: @especialidade }
      else
        format.html { render action: 'new' }
        format.xml  { render xml: @especialidade.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def especialidade_params
    params.require(:especialidade).permit()
  end
  
end
