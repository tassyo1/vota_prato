require 'rails_helper'

RSpec.describe Restaurante, type: :model do
  
  subject do 
    Restaurante.new(nome: "espeto carioca",
                    endereco:"rua silva",
                    especialidades: [create(:especialidade)] )
  end
  
  describe 'validações' do  
    it { is_expected.to validate_presence_of(:nome) }    
    it { is_expected.to validate_presence_of(:endereco) }    
    it { is_expected.to validate_presence_of(:especialidades) }    
    it { is_expected.to validate_uniqueness_of(:nome).case_insensitive}
    it { is_expected.to validate_uniqueness_of(:endereco).case_insensitive }
  end

  describe 'associações' do
    it { is_expected.to have_many(:comentarios) } 
    it { is_expected.to have_many(:qualificacoes) }
    it { is_expected.to have_and_belong_to_many(:especialidades)}
  end

  describe '#maiuscula' do
    it 'retorna campo capitalizado' do
      nome_down = subject.nome
      expect(subject.maiuscula(nome_down)).to eq("Espeto Carioca") 
    end
  end

  describe "#chama_maiuscula" do
    it 'capitaliza nome antes de salvar' do
      subject.save!
      expect(subject.nome).to eq("Espeto Carioca")
    end
    it 'capitaliza endereco antes de salvar' do
      subject.save!
      expect(subject.endereco).to eq("Rua Silva")
    end
  end
end
