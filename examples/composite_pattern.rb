=begin
Problema: tenemos estos dos objetos Product y Box, una Box puede tener varios Products y a la vez
otras Boxes. Estas cajas pequeñas también pueden contener otros Products o incluso más cajas con
productos y así sucesivamente.

¿Cómo podríamos saber el precio total de este pedido entonces? Tendríamos que lidiar con el nivel
de anidación de las boxes, interfaces de diferentes tipos de objetos, etc.

Solución: este patrón nos sugiere que trabajemos con estos objetos a través de una interfaz que
tengan en común que declare un método para calcular el precio. Lo que haría este método es que si
el objeto es un Product, este devolverá su precio, pero, si es una Box, va a recorrer todos los
Products de la caja y retornará su precio. Si alguno de estos Products fuera otra caja más pequeña
con otros Products, recorrerá sus Products retornando el total otra vez y así sucesivamente.

De esta manera no tenemos que preocuparnos de saber qué objetos hay en la caja o este tipo de
dolores de cabeza, sólo nos aseguramos que tengan esta interfaz y ya.

Para aplicar este patrón, la estructura del componente de software debe poder ser representada
como un árbol.
=end

class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end

class Box
  attr_accessor :products

  def initialize(products=[])
    @products = products
  end

  def price
    products.sum { |product| product.price }
  end

  def add_product(product)
    products << product
  end
end

blender = Product.new('Blender', 100)
stove = Product.new('Stove', 200)
candies_box = Box.new(
  [
    Product.new('Cotton candy', 5),
    Product.new('Gummy worm', 3),
    Product.new('Gummy worm', 3),
    Box.new(
      [Product.new('Bubble gum', 1), Product.new('Bubble gum', 1)]
    )
  ]
)
principal_box = Box.new
principal_box.add_product(blender)
principal_box.add_product(stove)
principal_box.add_product(candies_box)
puts "The total price is: #{principal_box.price}"
