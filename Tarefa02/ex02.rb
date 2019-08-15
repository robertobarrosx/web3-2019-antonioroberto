# 2Crie um sistema que receba o nome e o gênero de pessoas. Estas pessoas precisam ser cadastradas em um
# Hash com Symbols. Permitir ao usuário escolher um gênero e listar todas as pessoas cadastradas para o mesmo.
pessoas = []
pessoa = {:nome => 'Roberto', :sexo  => :masculino}
pessoas << pessoa
pessoa = {:nome => 'Flavia', :sexo  => :feminino}
pessoas << pessoa
pessoa = {:nome => 'Claudia', :sexo  => :feminino}
pessoas << pessoa
pessoa = {:nome => 'Maria', :sexo  => :feminino}
pessoas << pessoa
pessoa = {:nome => 'Mario', :sexo => :masculino}
pessoas << pessoa
op = 1
while op != 0 do
  puts("1 - Cadastrar \n2 - Visualizar\n0 - Sair")
  op = gets.to_i
  if op == 1
    puts "Digite o nome: "
    nome = gets.strip
    puts 'Selecione o gernero [1] Masculino [2] Feminino: '
    genero = gets.to_i
    if genero == 1
      gen = "masculino"
    elsif genero == 2
      gen = :feminino
    else
      gen = :sem
    end
    pessoa = {:nome => nome, :sexo => gen}
    pessoas << pessoa
  elsif op == 2
    puts 'Selecione o gernero [1] Masculino [2] Feminino [3] Sem genero: '
    opgen = gets.to_i
    if opgen == 1
      puts 'Genero Masculino'
      pessoas.each do |p|
        if :masculino == p[:sexo]
          puts "Nome: #{p[:nome]} \nSexo: Masculino"
        end
      end

    elsif opgen == 2
      puts 'Genero Feminino'
      pessoas.each do |p|
        if :feminino == p[:sexo]
          puts "Nome: #{p[:nome]} \nSexo: Feminino"
        end
      end
    else
      puts 'Sem Genero'
      pessoas.each do |p|
        if :sem == p[:sexo]
          puts "Nome: #{p[:nome]} \nSexo: Não Definido"
        end
      end
    end
  elsif op == 0
    puts "Sair"
    exit 0
  end
end

puts('Qual sexo deseja ver?')