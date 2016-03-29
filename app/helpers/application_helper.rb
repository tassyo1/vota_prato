module ApplicationHelper
	def valor_formatado(number)
		number_to_currency number,
		unit: "R$ ",
		separator: ",",
		delimiter: "."
	end

	def novo_comentario(comentavel)
		render partial: "comentarios/novo_comentario",
				locals: {comentavel: comentavel}
	end

	def comentarios(comentavel)
		render partial: "comentarios/comentarios",
				locals: {comentarios: comentavel.comentarios}
	end

	def menu_principal(controllers)
		render partial: "layouts/menu_principal", locals: {opcoes: controllers}
   #<%= menu_principal %w(restaurantes clientes qualificacoes pratos)	 %>
	end

	def receita(prato)
		render partial: "receitas/form", locals: {prato: prato}
	end

  def exibe_erros(model)
   render partial: "layouts/errors",
     locals: {modelo: model}
  end
end
