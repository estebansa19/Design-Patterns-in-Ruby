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
