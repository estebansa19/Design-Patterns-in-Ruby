=begin
Problema: tenemos una clase que está encargada de extraer información, al inicio, esta clase
solamente extraía información de archivos .doc, pero, posteriormente, vamos a tener que soportar
que extraiga la data de archivos .pdf y .csv. Sin embargo, el código para hacer gestión del
formato es diferente pero el análisis de la información y el procesamiento es casi idéntico para
los 3 tipos de archivos.

El código actual que tenemos tiene otro problema y es que tiene muchos condicionales que hacen que
el flujo vaya por un lado o por otro de acuerdo al tipo de archivo que tengamos
=end
