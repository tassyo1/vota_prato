require_relative "meu_modulo"
require_relative "modulo_correio"

class MeuMixin
	include Configuracoes
	include Correio
end

a = MeuMixin.new
a.calcular