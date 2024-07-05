require_relative 'HashMap'

# Crear una nueva instancia de HashMap
test = HashMap.new

# Poblar el HashMap
test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

# Verificar el tamaño y la capacidad
puts "Length: #{test.length}"  # Debería ser 12

# Sobrescribir algunos valores
test.set('apple', 'green')
test.set('banana', 'brown')

# Añadir un nuevo elemento para exceder el factor de carga
test.set('moon', 'silver')

# Verificar nuevamente el tamaño y la capacidad
puts "Length: #{test.length}"  # Debería ser 13

# Probar métodos adicionales
puts "Get apple: #{test.get('apple')}"  # Debería ser 'green'
puts "Has banana? #{test.has?('banana')}"  # Debería ser true
puts "Remove dog: #{test.remove('dog')}"  # Debería ser 'brown'
puts "Length after removal: #{test.length}"  # Debería ser 12
puts "Keys: #{test.keys.inspect}"
puts "Values: #{test.values.inspect}"
puts "Entries: #{test.entries.inspect}"

# Limpiar el HashMap
test.clear
puts "Length after clear: #{test.length}"  # Debería ser 0
puts "Keys after clear: #{test.keys.inspect}"  # Debería ser []
puts "Values after clear: #{test.values.inspect}"  # Debería ser []
