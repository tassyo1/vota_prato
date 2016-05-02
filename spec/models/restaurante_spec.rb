require 'rails_helper'

RSpec.describe Restaurante, type: :model do

  let(:esp) { FactoryGirl.create :especialidade }  
  let(:lista_especialidades) { [esp.id]  }
  subject { Restaurante.new(nome: "espeto carioca",
                            endereco: "rua Pampa n°3", especialidade_ids: lista_especialidades)
}
  
  describe 'validações' do  
    it { should validate_presence_of(:nome) }    
    it { should validate_presence_of(:endereco) }    
    it { should validate_presence_of(:especialidade_ids) }    
    it { should validate_uniqueness_of(:nome).case_insensitive}
    it { should validate_uniqueness_of(:endereco).case_insensitive }
  end

  describe 'Associações' do
    it { should have_many(:comentarios) } 
    it { should have_many(:qualificacoes) }
    it { should have_and_belong_to_many(:especialidades)}
  end

  describe '#maiuscula' do
    it 'Nome em letras maiúsculas' do
     subject.save!
     expect(subject.nome).to eql("Espeto Carioca")
    end

    it 'Endereço em letras maiúsculas' do
      subject.save!
      expect(subject.endereco).to eql("Rua Pampa N°3") 
    end
  end
end
