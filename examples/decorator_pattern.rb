=begin
Problema: imaginemos que estamos trabajando en un sistema de notificaciones que les permite a los
usuarios recibir notificaciones de eventos importantes vía correo eléctronico. A este punto sólo
tenemos una clase Notifier que se encarga de recibir la lista de usuarios y el mensaje que será
notificado. Posteriormente, nos damos cuenta de que los usuarios desean ser notificados vía SMS,
Facebook o incluso por Slack, de esta manera, vamos a extender la clase Notifier para cada una de
los métodos de notificación: SmsNotifier, FacebookNotifier y SlackNotifier. Pero, luego viene algo más,
qué pasa si un usuario desea ser notificado por varios sitios a la vez? Tendríamos que crear
subclases que combinen los métodos de notificación, algo como: FacebookSmsNotifier. A este punto
resultó evidente que con este approach nuestro código se va a ir inflando de manera exponencial,
por ejemplo, ¿qué pasaría si añadimos otro método de notificación más? ¿Cuántas clases se tendrían
que crear?

Solución: lo que nos plantea este patrón es crear un Wrapper para el objeto, este tiene su misma
interfaz y le delegará todo el comportamiento al mismo, pero, puede hacer que algo pase antes y/o
después de que se delegue este comportamiento. De esta manera, incluso podemos hacer wrap varias
veces a un mismo objeto y tener ese comportamiento que buscamos, con el que se pueda hacer un envío
de una notificación por un método combinado.
=end

class Notifier
  def send(message)
    puts "Nuevo evento: #{message}"
  end
end

class BaseNotifierDecorator
  attr_accessor :wrappee

  def initialize(wrappee)
    @wrappee = wrappee
  end

  def send(message)
    wrappee.send(message)
  end
end

class SmsDecorator < BaseNotifierDecorator
  def send(message)
    super
    puts 'Sent an SMS notification to 321-456-78-90 after default notification'
  end
end

class FacebookDecorator < BaseNotifierDecorator
  def send(message)
    puts 'Sent a Facebook notification to Esteban Dido before default notification'
    super
  end
end

class SlackDecorator < BaseNotifierDecorator
  def send(message)
    super
    puts 'Sent a Slack notification to Esteban dido after default notification'
  end
end

notifier = Notifier.new
notifier = FacebookDecorator.new(notifier)
notifier = SmsDecorator.new(notifier)
notifier.send('hello world!')
