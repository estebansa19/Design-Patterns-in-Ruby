=begin
Problema: tenemos una clase que está encargada de extraer información, al inicio, esta clase
solamente extraía información de archivos .doc, pero, posteriormente, vamos a tener que soportar
que extraiga la data de archivos .pdf y .csv. Sin embargo, el código para hacer gestión del
formato es diferente pero el análisis de la información y el procesamiento es casi idéntico para
los 3 tipos de archivos.

El código actual que tenemos tiene otro problema y es que tiene muchos condicionales que hacen que
el flujo vaya por un lado o por otro de acuerdo al tipo de archivo que tengamos

Solución: lo que nos plantea este patrón es que tengamos una clase base o plantilla que defina una
serie de pasos o métodos, estos pueden ser tanto abstractos o tener una implementación por defecto.
De esta manera cada clase de extracción de la información de un archivo va a definir los pasos
abstractos y podrá sobrescribir los métodos opcionales de acuerdo a lo que necesite.
=end

class DataMiner
  def mine(path)
    file = open_file(path)
    raw_data = extract_data(file)
    data = parse_data(raw_data)
    analysis = analyze_data(data)
    send_report(analysis)
    close_file(file)
  end

  private

  def open_file(path)
    # método con implementación por defecto
  end

  def extract_data(file)
    # abstract method
    raise NotImplementedError
  end

  def parse_data(raw_data)
    # abstract method
    raise NotImplementedError
  end

  def analyze_data(data)
    raise NotImplementedError
  end

  def send_report(analysis)
    # método con implementación por defecto
  end

  def close_file(file)
    # método con implementación por defecto
  end
end

class CsvMiner < DataMiner
  private

  def extract_data(file)
    # implementación específicia para los CSV
  end

  def parse_data(raw_data)
    # implementación específicia para los CSV
  end

  def analyze_data(data)
    # implementación específicia para los CSV
  end
end

class DocMiner < DataMiner
  private

  def extract_data(file)
    # implementación específicia para los DOC
  end

  def parse_data(raw_data)
    # implementación específicia para los DOC
  end

  def analyze_data(data)
    # implementación específicia para los DOC
  end
end

class PdfMiner < DataMiner
  private

  def extract_data(file)
    # implementación específicia para los PDF
  end

  def parse_data(raw_data)
    # implementación específicia para los PDF
  end

  def analyze_data(data)
    # implementación específicia para los PDF
  end
end
