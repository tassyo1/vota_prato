FactoryGirl.define do
  factory :restaurante do
    nome { Faker::Name.name.downcase! }
    endereco { Faker::Address.street_address.downcase! }
    especialidades { [create(:especialidade)] }
  end
end
