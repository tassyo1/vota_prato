require 'rails_helper'

RSpec.describe Restaurante, type: :model do

  let(:restaurante) { Restaurante.new }

  describe 'Validações' do 
    it { should validate_presence_of(:nome) }
    it { should validate_presence_of(:endereco)}
    it { should validate_presence_of(:especialidade)}
    
  end
end
