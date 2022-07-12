=begin
Problema: imaginemos que tenemos un objeto que requiere de una inicialización bastante laboriosa,
por ejemplo: la inicialización de una casa, podríamos tener una casa sencilla, con sus 4 paredes,
sus ventanas, su puerta y su tejado, pero, podríamos tener también una casa que sea más grande,
que tenga piscina, que tenga más ventanas, etc. Una solución podría ser extender la clase casa y
crear subclases por cada una de sus variantes posibles, pero, este planteamiento es prácticamente
insostenible por la cantidad de clases que serían creadas y de las que tendríamos que dar
mantenimiento. Otro planteamiento es, tener un método constructor inmenso que maneje todas las
variables que indicarán cómo será la casa que vamos a construir, pero, esta solución tampoco es tan
viable porque tendremos código que no es muy legible y será complicado de darle mantenimiento.

Solución: este patrón que saquemos el código de construcción del objeto y que lo coloquemos dentro
de objetos independientes llamados Constructores. El planteamiento ahora es que la construcción del
objeto sea por medio de una serie de pasos en este constructor. También, de esta manera podremos
invocar solamente los pasos que necesitemos en este momento y crear el objeto justo a la medida.
=end

class House
  attr_accessor :walls, :garden, :roof, :floor, :windows

  def initialize
    @walls = []
    @garden = nil
    @roof = nil
    @floor = nil
    @windows = []
  end
end

class HouseBuilder
  def initialize
    reset
  end

  def reset
    @house = House.new
  end

  def set_walls(walls)
    @house.walls = walls
  end

  def set_garden(garden)
    @house.garden = garden
  end

  def set_roof(roof)
    @house.roof = roof
  end

  def set_floor(floor)
    @house.floor = floor
  end

  def add_window(window)
    @house.windows << window
  end

  def get_house
    house = @house
    reset

    house
  end
end

house_builder = HouseBuilder.new
house_builder.set_walls('Stone walls')
house_builder.set_roof('Quartz roof')
house_builder.add_window('Big living room window')
house_builder.add_window('Bedroom window')
house_builder.add_window('Kitchen window')
house = house_builder.get_house
puts house.inspect
