class Product
  def operation
    raise NotImplementedError
  end
end

class SampleProductA < Product
  def operation
    '{Result of the SampleProductA}'
  end
end

class SampleProductB < Product
  def operation
    '{Result of the SampleProductB}'
  end
end

class Factory
  def factory_method
    raise NotImplementedError
  end

  def factory_operation
    product = factory_method

    result = "[Factory]: invoke product operation #{product.operation} \n"
  end
end

class SampleFactoryA < Factory
  def factory_method
    SampleProductA.new
  end
end

class SampleFactoryB < Factory
  def factory_method
    SampleProductB.new
  end
end

def handler(factory)
  printf "#{factory.factory_operation}"
end


puts "Launched with the SampleFactoryA \n"
handler(SampleFactoryA.new)

puts "Launched with the SampleFactoryB \n"
handler(SampleFactoryB.new)