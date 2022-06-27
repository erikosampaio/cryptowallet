#PS: Rodar o comando 'rails c' e seguir os códigos abaixo.
# Usando o método each é necessário criar uma variável que ficará perdida
a = Coin.all

b = []

a.each do |coin|
  b.push(coin)
end

# Usando método map - Não precisa criar variável
a.map do |coin|
  puts coin
end

# ou
a.map { |coin| puts coin }

# Dessa forma é possível retornar um array de arrays
a.map { |coin| [coin.description, coin.acronym] }

#Dessa forma NÃO é possível retornar um array de arrays
a.map(&:description)

# Usando método pluck - Não precisa criar variável
a.pluck(:description)

# Pode retornar um array de arrays
a.pluck(:description, :acronym)

 