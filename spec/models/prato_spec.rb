require 'rails_helper'

RSpec.describe Prato, type: :model do 

  describe "validações" do 
    it { should validate_presence_of(:nome) }
    it { should validate_presence_of(:descricao) }
    it { should validate_uniqueness_of(:nome).case_insensitive  }
  end

  describe "associações" do
    it { should have_one(:receita).autosave(true) }
    it { should accept_nested_attributes_for(:receita) }
  end

end
