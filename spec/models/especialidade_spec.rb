require 'rails_helper'

RSpec.describe Especialidade, type: :model do
  subject { Especialidade.new(nome:"Churrasco")}

  describe "Validações" do
    it { should validate_presence_of(:nome) }
  end

  describe "Associações" do
    it { should have_and_belong_to_many(:restaurantes)}
  end
end
