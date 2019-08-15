#
# 1Escreva um algoritmo que contenha uma função que retorne a soma entre todos os números entre um
# número inicial e outro final. Invoque a função com diversos parâmetros e mostre o resultado. Use interpolação.

def soma(inicial,final)
  soma = 0
  for i in inicial..final do
    soma += i
  end
  soma
end
soma1,soma2,soma3 = "Soma entre 1 e 100 resultado #{soma 1,100} ","Soma entre 20 e 40 resultado #{soma 20,40}","Soma entre 30 e 60 resultado #{soma 30,60}"
puts soma1,'',soma2,'',soma3

