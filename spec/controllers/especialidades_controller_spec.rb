require 'rails_helper'

RSpec.describe EspecialidadesController, type: :controller do
     describe "GET #index" do
       it '@especialidades preenchido com Especialidade.all' do
         expect(@especialidade).to eql(Especialidade.all.order(:nome))
       end
     end
end
