class Observer
  def update(subject)
    raise NotImplementedError
  end
end

class SampleObserver < Observer
  def update(subject)
    puts "[SampleObserver]: state: #{subject.state}\n" if subject.state == :stateA
  end
end

class Sample2Observer < Observer
  def update(subject)
    return unless subject.state == :stateA || subject.state != :stateB

    puts "[Sample2Observer]: state: #{subject.state}\n"
  end
end

class Subject
  def attach(observer)
    raise NotImplementedError
  end

  def detach(observer)
    raise NotImplementedError
  end

  def notify
    raise NotImplementedError
  end
end

class SampleSubject < Subject
  attr_accessor :state

  def initialize
    @observers = []
  end

  def attach(observer)
    @observers.push(observer)
  end

  def detach(observer)
    @observers.delete(observer)
  end

  def notify
    @observers.each do |observer|
      observer.update(self)
    end
  end

  def event_handler
    @state = [:stateA, :stateB, :stateC].sample(1)

    puts "SampleSubject: My state has just changed to: #{@state}\n"
    notify
  end
end

subject = SampleSubject.new

observer_a = SampleObserver.new
subject.attach(observer_a)

observer_b = Sample2Observer.new
subject.attach(observer_b)

subject.event_handler
subject.event_handler

subject.detach(observer_a)

subject.event_handler