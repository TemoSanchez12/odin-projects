require_relative 'LinkedList'

list = LinkedList.new()

# Crear una nueva lista enlazada
list = LinkedList.new

# Agregar elementos al final de la lista
list.append(10)
list.append(20)
list.append(30)

# Mostrar la lista
list.display
# Output: 10 -> 20 -> 30 -> nil

# Agregar elementos al inicio de la lista
list.prepend(0)
list.display
# Output: 0 -> 10 -> 20 -> 30 -> nil

# Eliminar un elemento de la lista
list.delete(20)
list.display
# Output: 0 -> 10 -> 30 -> nil
