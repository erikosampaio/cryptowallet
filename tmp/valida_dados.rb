require 'documentos_br'
require 'telefonia_br'

a = DocumentosBr.valid_cpf?('05247609344')

puts a


tel = TelBr.new("(88)8888888")

puts tel.stripped
puts tel.formatted
puts tel.number
puts tel.ddd
puts tel.state
puts tel.region
puts tel.error
puts tel.valid?
