#
# 5Escreva um programa que leia duas notas (necessariamente inteiras entre 0 e 10) e mostre a média
# ponderada obtida (função) a partir das mesmas. A primeira tem peso 2 e a segunda nota tem peso 3. O resultado pode conter casas decimais.
#
def media_ponderada(notas, pesos)
  dividendo = 0
  divisor = 0
  for i in 0..notas.length do
    dividendo += (notas[i].to_i * pesos[i].to_i).to_i
    divisor += pesos[i].to_i
  end
  (dividendo.to_f/divisor.to_f)
end
notas = []
pesos = [2,3]
puts 'digite a primeira nota: '
notas.append gets.strip.to_i
puts 'digite a segunda nota: '
notas.append gets.strip.to_i
puts media_ponderada notas, pesos


