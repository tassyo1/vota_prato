require 'rails_helper'

RSpec.describe EspecialidadesController, type: :controller do
  let(:especialidade) { FactoryGirl.create(:especialidade)}

  describe "GET #index" do
    it 'Atribuir todas as especialidades para @especialidades' do
      get :index
      expect(assigns(:especialidades)).to eq([especialidade])
     end
   end
end
