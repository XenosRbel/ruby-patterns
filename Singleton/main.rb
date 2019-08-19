class SingletonService
  attr_accessor :message
  @instance = new

  private_class_method :new

  def self.instance
    @instance
  end

  def send_message(message)
    @message = message
  end
end

singleton = SingletonService.instance
singleton.send_message('Hello')
printf "#{singleton.message}\n"

singleton2 = SingletonService.instance
printf "#{singleton2.message}\n"