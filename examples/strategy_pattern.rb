=begin
Problema: tenemos una aplicación que se encarga de hacer planificación de rutas y así de esta
manera, ayudar a los usuarios a orientarse en las ciudades. La primera versión de esta aplicación
soportaba viajes solamente de coche, pero, no todas las personas usaban este medio de transporte.
Así que, se añadió una manera de crear rutas a pie; luego, rutas en bicicleta; luego, otra para
tener rutas de las atracciones turísticas de una ciudad.

La parte técnica de esta aplicación era un dolor de cabeza porque tenía toda la implementación
basada en spaguetti code sin ninguna estructuración ni diseño.

Solución: lo que plantea este pattern es separar todos estos algortimos en clases separadas, las
cuales son conocidas como "estrategias" y la clase principal o "contexto" lo que tendrá es una
referencia a la estrategia que se vaya a usar y delega el trabajo de calculo de ruta a esta
estrategia. La clase principal tampoco conoce del funcionamiento de las estrategias, solamente las
recibe como parámetro y al tener todas la misma interfaz sólo se encarga de ejecutarla.
=end

class Navigator
  attr_reader :strategy

  def set_strategy(strategy)
    @strategy = strategy
  end

  def calculate_route(place_a, place_b)
    @strategy.execute(place_a, place_b)
  end
end

class RoadCalculatorStrategy
  def execute(place_a, place_b)
    # road route calculation example
    GoogleApi.call(...)
  end
end

class WalkingCalculatorStrategy
  def execute(place_a, place_b)
    # walking route calculation example
    GeoDataSourceService.call(...)
  end
end

class BicycleCalculatorStrategy
  def execute(place_a, place_b)
    # bicycle route calculation example
    PostGisService.call(...)
  end
end

# execution example

navigator = Navigator.new
navigator.set_strategy(BicycleCalculatorStrategy.new)
navigator.calculate_route(7.123123, 8.123123)
