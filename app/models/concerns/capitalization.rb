module Capitalization
  extend ActiveSupport::Concern
  module ClassMethods
    
  end

  module InstanceMethods

  end

# Coloca o nome do restaurante em letra maiúscula. Ex: "bom grill" => "Bom Grill"
  def maiuscula(variavel)
    variavel.downcase.split.map { |e| e.capitalize }.join(" ")
  end
end
