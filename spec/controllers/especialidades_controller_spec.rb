require 'rails_helper'

  RSpec.describe EspecialidadesController, type: :controller do
    subject(:especialidade_nova) { create(:especialidade) }     

    describe "GET #index" do
      before :each do
       get :index 
      end

      it 'atribuir todas as especialidades para @especialidades' do
        expect(assigns(:especialidades)).to eq([especialidade_nova])
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

    describe "DELETE #destroy" do
      it 'deleta a especialidade' do
        delete :destroy, id: especialidade_nova
        expect(Especialidade.count(0)).to eq(0)
      end 
    end

    describe "PATCH #update" do
      context 'com atributos válidos' do
        it 'localiza a @especialidade' do
          patch :update, id: especialidade_nova,
            especialidade: attributes_for(:especialidade)
          expect(assigns(:especialidade)).to eq especialidade_nova
         end

        it 'muda os atributos de @especialidade' do
          patch :update, id: especialidade_nova,
            especialidade: attributes_for(:especialidade,nome:"francesa")
          especialidade_nova.reload
          expect(especialidade_nova.nome).to eq("francesa")
        end
   
        it 'redireciona para rota especialidades_url(#index)' do
          patch :update, id: especialidade_nova,
            especialidade: attributes_for(:especialidade)
          expect(response).to redirect_to especialidades_url
        end 
      end

      context 'com atributos inválidos' do
        it 'redireciona para action #edit' do
          patch :update, id: especialidade_nova,
            especialidade: attributes_for(:especialidade, nome:nil)
          expect(response).to render_template :edit
        end
      end
      
    end


end
