# 4Escreva uma função, chamada soma_array, que retorne a soma dos elementos de um array.

def soma_array(array)
  arraylist = ''
  for i in array do
    arraylist+=i
  end
  arraylist
end

array1 = ['aff','app','all','acc','att','akk','arr','ayy']
array3 = soma_array array1
puts array3