  require 'rails_helper'

  RSpec.describe EspecialidadesController, type: :controller do
    #let(:esp) { FactoryGirl.create(:especialidade)}
      
    describe "GET #index" do
     let(:esp) { create(:especialidade)}

      before :each do
       get :index 
      end

      it 'atribuir todas as especialidades para @especialidades' do
        expect(assigns(:especialidades)).to eq([esp])
      end
      
      it 'redirecionar para index.html.erb' do
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
      context 'com atributos válidos' do
        it 'cria nova  especialidade' do
          post :create, especialidade: attributes_for(:especialidade)
          expect(Especialidade.count).to eq(1)
         end  

        it 'redireciona para a action "index" após criar uma nova' do
          post :create, especialidade: attributes_for(:especialidade)
          expect(response).to redirect_to (assigns(:especialidades))
        end
      end

      context 'com atributos inválidos' do
        it 'não cria uma nova especialidade' do
          post :create, especialidade: attributes_for(:especialidade, nome:nil)
          expect(Especialidade.count(0)).to eq(0)
        end

        it 'redireciona para action "new"' do
          post :create, especialidade: attributes_for(:especialidade, nome:nil)
          expect(response).to render_template :new
        end
      end
  end
end
