class Set

  attr_reader :elements
  
  def initialize(max_elements)
    @elements = []
    @max_elements = max_elements
  end  

  def add(element)
    @elements << element
  end

  def intersection(other_set)
    result = []
    @elements.each do |element|
      if other_set.elements.include?(element)
        result << element
      end
    end
    if result.size == 0
      return puts "vazio"
    end
    p result.sort.join(" ")
  end  

  def difference(other_set)
    result = []
    @elements.each do |element|
      if !other_set.elements.include?(element)
        result << element
      end
    end
    if result.size == 0
      return puts "vazio"
    end
    p result.sort.join(" ")
  end

  def subset?(other_set)
    if @elements.length <= other_set.elements.length
      if @elements.all? { |element| other_set.elements.include?(element) }
        return puts true
      else
        return puts false
      end
    end
  end
end
