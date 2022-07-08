=begin
Problema: imaginemos que estamos creando una aplicación de logística, la primera versión de esta
aplicación sólo es capaz de manejar transporte por camión así que tenemos gran parte de esta lógica
en la clase Camion. A nuestra aplicación le va bien y posteriormente nos solicitan que
implementemos transporte maritimo también. El problema es que en este momento todo el código está
demasiado acoplado a la clase Camion y tendríamos que hacer bastantes cambios.

Lo peor es que si se desea añadir otro medio de transporte más tendremos que hacer de nuevo otra
vez estos cambios y tener un flujo de código con condicionales que se encarguen de ejecutar x o y
comportamiento.

Solución: este patrón nos plantea que tengamos una clase de creación de objetos base y que a partir
de esta creemos otras subclases por cada una de las especificaciones que necesitemos con su
respectivo comportamiento. Todas estas subclases deben compartir la misma interfaz para que podamos
tratar a todos los objetos por igual.

Normalmente la principal función de la clase Creator no es crear los elementos, si no, abstraer
lógica que se comparte para todos ellos.
=end

class LogisticTransport
  def factory_method
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def deliver
    product = factory_method
    result = "Delivery information: #{product.deliver}"

    result
  end
end

class Transport
  def deliver
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class Camion < Transport
  def deliver
    'Delivered by a camion'
  end
end

class Ship < Transport
  def deliver
    'Delivered by a ship'
  end
end

class CamionCreator < LogisticTransport
  def factory_method
    Camion.new
  end
end

class ShipCreator < LogisticTransport
  def factory_method
    Ship.new
  end
end

puts CamionCreator.new.deliver
puts ShipCreator.new.deliver
