class Car
  def open_door
    '[Base]: Open Door'
  end
end

class Decorator < Car
  attr_accessor :car

  def initialize(car)
    @car = car
  end

  def open_door
    "[Decorated]: #{@car.open_door} as at mercedes benz"
  end

  def turn_on_lights
    printf 'Green lights'
  end
end

def client_code(car)
  printf "#{car.open_door}\n"
end

component = Car.new
client_code(component)

decorator = Decorator.new(component)
client_code(decorator)
decorator.turn_on_lights