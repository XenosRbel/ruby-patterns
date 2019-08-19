class Command
  def execute
    raise NotImplementedError
  end
end

class SampleCommand < Command
  def initialize(payload)
    @payload = payload
  end

  def execute
    puts "[SampleCommand]: payload: #{@payload}"
  end
end

class Receiver
  def method_a(a)
    printf "[Receiver]: work in method a #{a}\n"
  end

  def method_b(b)
    printf "[Receiver]: work in method b #{b}\n"
  end
end

class ComplexCommand < Command
  def initialize(receiver, a, b)
    @receiver = receiver

    @a = a
    @b = b
  end

  def execute
    print '[ComplexCommand]: execute by a receiver object'

    @receiver.method_a(@a)
    @receiver.method_b(@b)
  end
end

class Invoker

  def on_start=(command)
    @on_start = command
  end

  def on_finish=(command)
    @on_finish = command
  end

  def handler
    puts '[Invoker]: begin'
    @on_start.execute if @on_start.is_a? Command

    puts '{Invoker}: doing something'

    puts '[Invoker]: finish'
    @on_finish.execute if @on_finish.is_a? Command
  end
end

invoker = Invoker.new
invoker.on_start = SampleCommand.new('Let\'s start')

receiver = Receiver.new

invoker.on_finish = ComplexCommand.new(receiver, 'turn on', 'turn off')

invoker.handler