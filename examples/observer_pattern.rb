=begin
Problema: imaginemos tenemos un objeto de Tienda y otro de Cliente, los clientes están muy interesados en un
producto en particular (el nuevo iPhone). El cliente puede visitar la tienda muchas veces para
comprobar la disponibilidad de este producto pero puede que muchas de estas visitas sean en vano.

La tienda podría enviar un correo de notificación a todos los clientes. Esto terminaría con el
problema de los viajes a la tienda pero tiene otro problema y es que podríamos notificar a personas
que no estén interesadas en el producto.

Solución: el objeto que tiene un estado interesante y que va a notificar a los otros se conoce como
sujeto o notificador, el resto de objetos que están pendientes de conocer este estado son conocidos
como suscriptores. Lo que nos sugiere este patrón es que añadamos un mecanismo de suscripción a la
clase notificadora para que los objetos individuales (suscriptores) puedan suscribirse o cancelar su
suscripción a un flujo de eventos que proviene de esta clase notificadora.
=end

class Suscriber
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def update(context)
    puts "Hi #{name}, the  new #{context.new_product} has arrived!"
  end
end

class Store
  attr_reader :suscribers, :new_product

  def initialize
    @suscribers = []
  end

  def set_new_product(new_product)
    @new_product = new_product
  end

  def add_suscriber(suscriber)
    suscribers << suscriber
  end

  def remove_suscriber(suscriber)
    suscribers.delete(suscriber)
  end

  def notify_suscribers
    suscribers.each { |suscriber| suscriber.update(self) }
  end
end

suscribers = [Suscriber.new('Esteban'), Suscriber.new('Carlos'), Suscriber.new('Ana')]
apple_store = Store.new
suscribers.each { |suscriber| apple_store.add_suscriber(suscriber) }
apple_store.set_new_product('iPhone 14')
apple_store.notify_suscribers
