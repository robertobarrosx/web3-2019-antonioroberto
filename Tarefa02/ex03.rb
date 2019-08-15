#
# 3Crie um programa em Ruby que receba uma string com seu nome completo e mostre na tela somente o seu nome
# e sobrenome. Ex.: "João Marcos Cavalcante Bezerra", o programa deverá mostrar "João Bezerra". Dica: use o método split.
#
def firstandlastName(nome)
  eita = nome.split ' '
  "#{eita.first} #{eita.last}"
end
puts 'Digite o seu nome completo: '
nome = gets.strip
puts firstandlastName nome