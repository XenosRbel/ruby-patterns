#Plug
class Plug
  def specific_connect
    "[Plug]: Specific_connect\n\n"
  end
end

#Taget
class EuroSocket
  def connect_plug
    "[Euro Socket]: Plug ready\n"
  end
end

#Adapter
class EuroSocketAdapter < EuroSocket
  def initialize(custom_plug)
    @plug = custom_plug
  end

  def connect_plug
    "[Adapter]: You can use specific plug #{@plug.specific_connect}\n"
  end
end

def SetUpPlug(euroSocket)
  print euroSocket.connect_plug
end

target = EuroSocket.new
SetUpPlug(target)

my_plug = Plug.new
printf my_plug.specific_connect

adapter = EuroSocketAdapter.new(my_plug)
SetUpPlug(adapter)