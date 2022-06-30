=begin
Problema: imaginemos que estamos creando una aplicación de monitoreo del mercado de valores, esta
aplicación, hasta este momento descarga información de la bolsa de varias fuentes en foramto XML.
Queremos implementar una biblioteca de análisis de un tercero, pero tenemos un problema, esta
aplicación sólo funciona con JSON. Una solución sería cambiar la aplicación de la biblioteca para
que funcione con XML, pero, esto es complicado porque puede requerir de demasiado trabajo y/o puede
que no tengamos acceso a esta biblioteca.

Solución: Lo que busca este patrón es que creemos un objeto especial, un Adapter, que convierta una
interfaz incompatible para un objeto a una que pueda comprender. El Adapter en este caso implementa
una interfaz, recibe una llamada y pasa esta solicitud al segundo objeto pero en un fórmato y
estructura que este pueda entender. Así que en este caso podríamos quedar un Adapter de XML a JSON,
así, cuando reciba la llamada a esta biblioteca de terceros parecerá que estamos trabajando con un
XML.

Puede hacerse una analogía con los adaptadores que necesitamos para conectarnos a tomas corrientes
si viajamos a otras partes del mundo.
=end

class MarketAnalyzer
  # get JSON data about crypto currencies
  def crypto_data
    json_response = CryptoDataService.get_data
  end

  # get JSON data about Internet of Things
  def iot_data
    json_response = InternetOfThingsService.get_data
  end

  # get XML data about banks but using an adapter to work as a JSON
  def banks_data
    json_response = XMLToJsonAdapter.new(BanksService.get_data)
  end
end
