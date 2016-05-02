require 'rails_helper'

RSpec.describe EspecialidadesController, type: :controller do
  let(:esp) { FactoryGirl.create(:especialidade)}

  describe "GET #index" do
    it 'atribuir todas as especialidades para @especialidades' do
      get :index
      expect(assigns(:especialidades)).to eq([esp])
    end
    
    it 'redirecionar para index.html.erb' do
      get :index
      expect(response).to render_template("index")
    end
   end

  describe "GET #new" do
    it 'atribuir uma nova especialidade para @especialidade' do
      get :new
      expect(assigns(:especialidade)).to be_a_new(Especialidade) 
    end 
  end

  describe "POST #create" do
    it 'cria uma especialidade' do
    end  
  end
end
