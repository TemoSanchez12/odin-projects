require_relative 'Tree'

# Crear un árbol binario de búsqueda con un array de números aleatorios
tree = Tree.new(Array.new(15) { rand(1..100) })

# Confirmar que el árbol está balanceado
puts "¿El árbol está balanceado? #{tree.balanced?}"

# Imprimir todos los elementos en orden de nivel, preorden, postorden y en orden
puts "Elementos en orden de nivel: #{tree.level_order}"
puts "Elementos en preorden: #{tree.preorder}"
puts "Elementos en postorden: #{tree.postorder}"
puts "Elementos en orden: #{tree.inorder}"

# Desbalancear el árbol añadiendo varios números mayores a 100
[101, 102, 103, 104, 105].each { |num| tree.insert(num) }

# Confirmar que el árbol está desbalanceado
puts "¿El árbol está balanceado después de agregar elementos? #{tree.balanced?}"

# Balancear el árbol
tree.rebalance

# Confirmar que el árbol está balanceado
puts "¿El árbol está balanceado después de reequilibrar? #{tree.balanced?}"

# Imprimir todos los elementos en orden de nivel, preorden, postorden y en orden
puts "Elementos en orden de nivel después de reequilibrar: #{tree.level_order}"
puts "Elementos en preorden después de reequilibrar: #{tree.preorder}"
puts "Elementos en postorden después de reequilibrar: #{tree.postorder}"
puts "Elementos en orden después de reequilibrar: #{tree.inorder}"

tree.pretty_print
