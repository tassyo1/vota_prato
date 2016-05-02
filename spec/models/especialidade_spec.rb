require 'rails_helper'

RSpec.describe Especialidade, type: :model do
  subject { Especialidade.new(nome:"Churrasco")}

  describe "validações" do
    it { should validate_presence_of(:nome) }
    it { should validate_uniqueness_of(:nome).case_insensitive }
  end

  describe "associações" do
    it { should have_and_belong_to_many(:restaurantes)}
  end
end
