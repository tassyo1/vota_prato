require 'test_helper'

class RestauranteTest < ActiveSupport::TestCase
  fixtures :restaurantes

  def test_restaurante
  	#assert true
    
  	restaurante = Restaurante.new(
  		nome: restaurantes(:fasano).nome,
  		endereco: restaurantes(:fasano).endereco,
  		especialidade: restaurantes(:fasano).especialidade)

  	msg = "restaurante não foi salvo. "+ "errors: #{restaurante.errors.inspect}"
  	b = restaurante.save
    
    if b
      assert(b, "Ronaldo...") 
    else
      assert(b, "Marina...") 
    end  

  	restaurante_fasano_copia = Restaurante.find_by nome: restaurante.nome
    msg2= "restaurante já cadastrado"+ "errors: #{restaurante.errors.inspect}"  	
    assert_equal(restaurante.nome, restaurante_fasano_copia.nome,msg2)
  end
end
