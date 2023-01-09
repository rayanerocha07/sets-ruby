require_relative "set.rb"

class Program 

  attr_reader :set_a, :set_b

  def initialize
    @set_a = {max_elements: nil, elements: []}
    @set_b = {max_elements: nil, elements: []}
  end

  def start
    puts "Digite o número máximo de elementos do conjunto A: "
    @set_a[:max_elements] = gets.chomp.to_i
    while @set_a[:max_elements] <= 0 || @set_a[:max_elements] > 50
      puts "Digite o número máximo de elementos do conjunto A: "
      @set_a[:max_elements] = gets.chomp.to_i      
    end  

    puts "Digite os elementos do conjunto A: "
    foo = gets.chomp.to_s
    @set_a[:elements] = foo.split(" ").map() { |number| number.to_i }
    while @set_a[:elements].size != @set_a[:max_elements]
      puts "Digite os elementos do conjunto A: "
      foo = gets.chomp.to_s
      @set_a[:elements] = foo.split(" ").map() { |number| number.to_i }  
    end

    puts "Digite o número máximo de elementos do conjunto B: "
    @set_b[:max_elements] = gets.chomp.to_i 
    while @set_b[:max_elements] <= 0 || @set_b[:max_elements] > 50
      puts "Digite o número máximo de elementos do conjunto B:"
      @set_b[:max_elements] = gets.chomp.to_i
    end    

    puts "Digite os elementos do conjunto B: "
    foo = gets.chomp.to_s
    @set_b[:elements] = foo.split(" ").map() { |number| number.to_i }
    while @set_b[:elements].size != @set_b[:max_elements]
      puts "Digite os elementos do conjunto B: "
      foo = gets.chomp.to_s
      @set_b[:elements] = foo.split(" ").map() { |number| number.to_i }  
    end
    
    created_set_a = create_set(@set_a[:max_elements], @set_a[:elements])
    created_set_b = create_set(@set_b[:max_elements], @set_b[:elements])

    menu(created_set_a, created_set_b)
  end
    
  private
  def create_set(max_elements, elements)
    set = Set.new(max_elements)
    elements.each do |element|
      set.add(element)
    end
    set
  end

  def menu(created_set_a, created_set_b)
    puts "Digite a opção desejada: "
    opcao = gets.chomp.to_i
    case opcao
    when 1 
      intersection(created_set_a, created_set_b)
      menu(created_set_a, created_set_b)
    when 2
      difference(created_set_a, created_set_b)
      menu(created_set_a, created_set_b)
    when 3
      subset?(created_set_a, created_set_b)
      menu(created_set_a, created_set_b)
    when 4    
      finish
    else 
      puts "Opção inválida."
      menu(created_set_a, created_set_b)
    end  
  end 

  def intersection(created_set_a, created_set_b)
    created_set_a.intersection(created_set_b)
  end

  def difference(created_set_a, created_set_b)
    created_set_a.difference(created_set_b)
  end

  def subset?(created_set_a, created_set_b)
    created_set_a.subset?(created_set_b)
  end

  def finish
  end
end
