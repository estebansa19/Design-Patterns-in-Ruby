=begin
Problema: este patrón busca solucionar dos problemas:

1. Que una clase tenga solamente una instancia, esto puede ser útil cuando estamos trabajando con
instancias de la DB o recursos compartidos.

2. Proporcionar un punto de acceso global a esta instancia, esto hará que sea mucho más seguro que
simplemente definir variables globales y ya.

Solución: este patrón nos sugiere tener una clase la cual modofiquemos el método de inicialización
para que solamente pueda tener una sola instancia.
=end

# Manual Singleton
class Klass1
  @instance = new

  private_class_method :new

  def self.instance
    @instance
  end

  def greet
    puts "Hi, I'm #{object_id}"
  end
end

Klass1.instance.greet
Klass1.instance.greet

# Singleton with Ruby module implementation
require 'singleton'

class Klass2
  include Singleton

  def greet
    puts "Hi, I'm #{object_id}"
  end
end

Klass2.instance.greet
Klass2.instance.greet
