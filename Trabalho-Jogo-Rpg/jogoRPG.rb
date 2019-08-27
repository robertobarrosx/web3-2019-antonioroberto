# Modele e escreva um programa (terminal) que crie personagens para um jogo de RPG.
#
# Todos os personagens tem nome, idade, vida, ataque, defesa, inteligência, força, e uma Raça (Humano, Elfo, Orc, Anão - herança).
#
# Os personagens começam com uma classe e podem treinar para ter uma outra classe adicional, ganhar mais habilidades e seus modificar atributos.
#
# As classes adicionam habilidades aos personagens, bem como incrementam (ou decrementam) valores de atributos.
#
# As raças são estáticas (criar classes que herdam da classe Raca), mas classes (dos personagens) podem ser cadastradas, junto aos seus modificadores.
#
# Deve ser possível calcular a força de ataque/defesa de cada personagem. Para tal, crie um cálculo usando seus atributos-base com modificadores de classe.
#
# Deve ser possível listar todos os personagens de uma raça.
#
# Deve ser possível listar todos os personagens de uma classe.
Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

class Personagem
  attr_accessor :nome, :idade, :raca, :classes
  def to_s

    str = "Nome: #{@nome} Idade: #{@idade}  Classes: "
    x = 0;
    @classes.each do |p|
      if x != 0
        str += ","
      end
      x += 1
      str += " #{p.nome}"
    end
    str += " Raça: #{@raca}  #{calcular}\n\n"
  end
  def calcular
    vida = @raca.vida
    ataque = @raca.ataque
    defesa = @raca.defesa
    forca = @raca.forca
    inteligencia = @raca.inteligencia
    @classes.each do |c|
        c.modificadores.each do |atrib,valor|
          #puts "Entrou aqui #{atrib} #{valor}"
          if atrib.to_s == "vida"
            vida += valor
          elsif atrib.to_s == "forca"
            forca += valor
          elsif atrib.to_s == "defesa"
            defesa += valor
          elsif atrib.to_s == "inteligencia"
            inteligencia += valor
          elsif atrib.to_s == "ataque"
            ataque += valor
          end

       end
    end
    str = "\nVida: #{vida} "
    if vida != @raca.vida
      if vida > @raca.vida
        str += "(+"
      else
        str += "("
      end
      str += "#{vida-@raca.vida}) "
    end
    str += "Ataque: #{ataque} "
    if ataque != @raca.ataque
      if ataque > @raca.ataque
        str += "(+"
      else
        str += "("
      end
      str +="#{ataque-@raca.ataque})"
    end
    str += " Defesa: #{defesa} "
    if defesa != @raca.defesa
      if defesa > @raca.defesa
        str += "(+"
      else
        str += "("
      end
      str +="#{defesa-@raca.defesa}) "
    end
    str+= "Inteligencia: #{inteligencia} "
    if inteligencia != @raca.inteligencia
      if inteligencia > @raca.inteligencia
        str += "(+"
      else
        str += "("
      end
      str += "#{inteligencia-@raca.inteligencia}) "
    end
    str +="Força: #{forca} "
    if forca != @raca.forca
      if forca > @raca.forca
        str += "(+"
      else
        str += "("
      end
      str +="#{forca-@raca.forca})"
    end
    str += ""
  end
end
class Classe
  attr_reader  :nome, :habilidade, :modificadores
  def initialize nome,habilidade,modificadores
    @nome = nome
    @habilidade = habilidade
    @modificadores = modificadores
  end
  def to_s
    "#{@nome} Habilidade: #{@habilidade} Modificadores: #{@modificadores} "
  end
end
class Raca
  attr_reader :vida, :ataque, :defesa, :inteligencia, :forca
  def to_s
    "Vida: #{@vida}  Ataque: #{@ataque} Defesa: #{@defesa} Inteligencia: #{@inteligencia}  Força: #{@forca}"
  end
end

class Humano < Raca
  def initialize
    @vida = 20
    @ataque = 8
    @defesa = 8
    @inteligencia = 10
    @forca = 10
  end
  def to_s
    "Humano"
  end
end

class Elfo < Raca
  def initialize
    @vida = 25
    @ataque = 5
    @defesa = 6
    @inteligencia = 20
    @forca = 10
  end
  def to_s
    "Elfo"
  end
end

class Anao < Raca
  def initialize
    @vida = 18
    @ataque = 9
    @defesa = 11
    @inteligencia = 7
    @forca = 20
  end
  def to_s
    "Anão"
  end
end
class Orc < Raca
    def initialize
      @vida = 15
      @ataque = 12
      @defesa = 5
      @inteligencia = 2
      @forca = 25
    end
    def to_s
      "Orc"
    end
end
classes = []
classes << (Classe.new "Construtor 🔨", "Construir Casas",{:vida => -2, :inteligencia => 1, :forca => 1 })
classes << (Classe.new "Ferreiro ⚒", "Construir Espadas e Armaduras",{:ataque => 1, :forca => 2 })
classes << (Classe.new "Curandeiro 💉", "Curar",{:ataque => -1, :defesa => 3, :inteligencia => 3 })
classes <<  (Classe.new "Guerreiro 🏹", "Atacar, defender", {:ataque => 3, :defesa => 2, :forca => 2 })
Personagens = []

opcaoPrincipal = 1;
while opcaoPrincipal !=6 do
    puts '1 - Criar Personagem'
    puts '2 - Criar Classe'
    puts '3 - Evoluir Pesonagem'
    puts '4 - Listar Personagens por Classe'
    puts '5 - Listar Pesonagens por Raça'
    puts '6 - Sair'
    opcaoPrincipal = gets.to_i

    if opcaoPrincipal == 1
      #CriarPersonagens
      person = Personagem.new
      puts 'Digite o nome do Personagem: '
      person.nome = gets.chomp
      puts 'Digite a idade do Personagem: '
      person.idade = gets.to_i
      puts 'Escolha uma Raça:'
      puts '1 - Humano 👱🏻'
      puts '2 - Elfo ‍'
      puts '3 - Anão 🦂'
      puts '4 - Orc 🐷'
      opcaoRaca = gets.to_i
      if opcaoRaca == 1
        person.raca = Humano.new
      elsif opcaoRaca == 2
        person.raca = Elfo.new
      elsif opcaoRaca == 3
        person.raca = Anao.new
      elsif opcaoRaca == 4
        person.raca = Orc.new
      end
      puts 'Escolha uma Classe: '

      classes.each_with_index do |classe,i|
        puts "#{i+1} - #{classe.nome}"
      end
      opClasse = gets.to_i
      classe = []
      if opClasse > classes.length
        classe << classes[0]
      else
        classe << classes[opClasse-1]
      end
      person.classes = classe
      Personagens << person
    elsif opcaoPrincipal == 2
      #CriarClasses
      # classes << (Classe.new "Construtor 🔨", "Construir Casas",{:vida => -2, :inteligencia => 1, :forca => 1 })
      puts 'Digite o nome da classe: '
      nomeClasse = gets.strip.to_s
      puts "Digite a habilidade da classe #{nomeClasse}: "
      habilidadeClasse = gets.strip.to_s
      pontos = 5
      vidaClasse,ataqueClasse,defesaClasse,inteligenciaClasse,forcaClasse = 0,0,0,0,0

      while pontos > 0 do
        puts "Você tem #{pontos} pontos para distribuir entre os atributos: "
        puts "Vida\t\tAtaque\t\tDefesa\t\tInteligencia\t\tForça"
        puts "#{vidaClasse}\t\t#{ataqueClasse}\t\t#{defesaClasse}\t\t#{inteligenciaClasse}\t\t\t#{forcaClasse}"
        puts 'Qual Atributo pretende modificar?'
        puts '1 - Vida'
        puts '2 - Ataque'
        puts '3 - Defesa'
        puts '4 - Inteligencia'
        puts '5 - Força'
        opcaoModificador = gets.to_i
        if opcaoModificador == 1
          puts "Defina os pontos para Vida: "
          pontosAux = gets.to_i
          if pontos >= pontosAux and ((vidaClasse + pontosAux) >= -5)
            vidaClasse += pontosAux
            pontos -= pontosAux
          end
        elsif opcaoModificador == 2
          puts "Defina os pontos para Ataque: "
          pontosAux = gets.to_i
          if pontos >= pontosAux and ((ataqueClasse + pontosAux) >= -5)
            ataqueClasse += pontosAux
            pontos -= pontosAux
          end
        elsif opcaoModificador == 3
          puts "Defina os pontos para Defesa: "
          pontosAux = gets.to_i
          if pontos >= pontosAux and (defesaClasse + pontosAux) >= -5
            defesaClasse += pontosAux
            pontos -= pontosAux
          end
        elsif opcaoModificador == 4
          puts "Defina os pontos para Inteligencia: "
          pontosAux = gets.to_i
          if pontos >= pontosAux and (inteligenciaClasse + pontosAux) >= -5
            inteligenciaClasse += pontosAux
            pontos -= pontosAux
          end
        elsif opcaoModificador == 5
          puts "Defina os pontos para Força: "
          pontosAux = gets.to_i
          if pontos >= pontosAux and (forcaClasse + pontosAux) >= -5
            forcaClasse += pontosAux
            pontos -= pontosAux
          end
        end

      end
      # classes << (Classe.new "Construtor 🔨", "Construir Casas",{:vida => -2, :inteligencia => 1, :forca => 1 })
      classes << (Classe.new nomeClasse,habilidadeClasse,{:vida => vidaClasse, :ataque => ataqueClasse, :inteligencia => inteligenciaClasse, :defesa => defesaClasse, :forca => forcaClasse})
      puts "Classe \"#{nomeClasse}\" criada com sucesso!"

    elsif opcaoPrincipal == 3
      puts 'Selecione o personagem para evoluir: '
      Personagens.each_with_index do |atrib,valor|
        puts "#{valor+1} - #{atrib.nome}"
      end
      valor = 0
      while valor < 1 or valor > Personagens.length
        valor = gets.to_i
      end
      classes_auxiliares = []
      classes.each do |classe|
        if Personagens[valor-1].classes.include?classe
          #nada
        else
          classes_auxiliares << classe
        end
      end
      if classes_auxiliares.length < 1
        puts 'Esse personagem já está no nivel maximo!'
      else
        puts 'Selecione uma classe: '
        classes_auxiliares.each_with_index do |lass,count |
          puts "#{count+1} - #{lass}"
        end
        valorC = 0
        while valorC < 1 or valorC > classes_auxiliares.length
          valorC = gets.to_i
        end
        Personagens[valor-1].classes << classes_auxiliares[valorC-1]
      end
    elsif opcaoPrincipal == 4
      #Listar Personagens por Classe
      puts 'Selecione uma classe: '
      classes.each_with_index do |mass,c|
        puts "#{c+1} - #{mass.nome}"
      end
      valorCc = 0
      while valorCc < 1 or valorCc > classes.length
        valorCc = gets.to_i
        if valorCc < 1 or valorCc > classes.length
          puts 'Digite um valor valido: '
        end
      end
      Personagens.each do |p|
        if p.classes.include?classes[valorCc-1]
          puts p
        end
      end
    elsif opcaoPrincipal == 5
      #Listar Personagens por Raça
      puts 'Selecione uma raça:'
      puts "1 - Humano 👱🏻"
      puts "2 - Elfo"
      puts "3 - Anão 🦂"
      puts "4 - Orc 🐷"
      valorCc = 0
      while valorCc < 1 or valorCc > classes.length
        valorCc = gets.to_i
        if valorCc < 1 or valorCc > classes.length
          puts 'Digite um valor valido: '
        end
      end
      if valorCc == 1
        opRaca = Humano.new
      elsif valorCc == 2
        opRaca = Elfo.new
      elsif valorCc == 3
        opRaca = Anao.new
      elsif valorCc == 4
        opRaca = Orc.new
      end
      Personagens.each do |nagem|
        if nagem.raca.to_s == opRaca.to_s
          puts nagem
        end
      end
    elsif opcaoPrincipal == 6
      exit
    end
end
