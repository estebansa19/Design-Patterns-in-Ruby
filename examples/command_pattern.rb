=begin
Problema: imaginemos que estamos creando un editor de código y en este momento estamos
desarrollando la barra de herramientas, esta va a contar con unos cuantos botones y diversas
funciones. Para esto creamos una clase base Button, de la cual se van a basar todos los otros
botones y crearemos una subclase por cada espeficicación de qué debe hacer un botón al hacerle
click.

Esto tiene un gran problema y es que vamos a terminar con muchas subclases y estas van a estar
demasiado acopladas a la clase de Button, así que, un cambio en la clase Button podría desencadenar
en muchísimos cambios. Otro problema de esta implementación es que vamos a tener lógica de negocios
que se debe ejecutar desde varios sitios, así que, es probable que eventualmente tengamos que
duplicar lógica de negocios entre las clases de los botones u otras implementaciones futuras, lo
que rompe el principio de Single Responsability.

Solución: una decisión que se podría tomar en este tipo de situaciones es separar el componente por
capas, una capa que será la parte visual y otra que estará encargada de la lógica de negocios,
siguiendo este esquema podríamos tener componentes de la capa visual que se comuniquen con la capa
de la lógica de negocios. Este patrón sugiere que tengamos un objeto intermedio entre la capa
visual y la de la lógica de negocios, este será el Command. De esta manera los componentes de la
capa visual no tiene qué saber de  los componentes de la capa de la lógica de negocios ni su
implementación. El siguiente paso es hacer que los Command implementen una misma interfaz,
de esta manera vamos a evitar acoplamiento entre las clases que usen estos Command.
=end

class CopyToClipboardService
  def self.call(txt, user)
    puts "Copied to clipboard: '#{txt}', and saved a history record to the DB for: '#{user}'"
  end
end

class CopyToClipboardCommand
  attr_accessor :text_to_copy, :user

  def initialize(text_to_copy, user)
    @text_to_copy = text_to_copy
    @user = user
  end

  def execute
    CopyToClipboardService.call(text_to_copy, user)
  end
end

class GuiButton
  attr_accessor :text, :command

  def initialize(text, command)
    @text = text
    @command = command
  end

  def click
    command.execute
  end
end

copy_command = CopyToClipboardCommand.new('hello world!', 'Esteban Dido')
copy_button = GuiButton.new('copy text to clipboard', copy_command)
copy_button.click
