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
end
