def knight_moves(start, target)
  moves = [
    [2, 1], [2, -1], [-2, 1], [-2, -1],
    [1, 2], [1, -2], [-1, 2], [-1, -2]
  ]

  return [start] if [start] == target

  queue = [[start]]
  visited = Array.new(8) { Array.new(8, false) }
  visited[start[0]][start[1]] = true

  until queue.empty?
    path = queue.shift
    current_pos = path.last

    moves.each do |move|
      new_pos = [current_pos[0] + move[0], current_pos[1] + move[1]]

      next if new_pos.any? { |coord| coord < 0 || coord>= 8 } || visited[new_pos[0]][new_pos[1]]

      new_path = path + [new_pos]
      return new_path if new_pos == target

      queue << new_path
      visited[new_pos[0]][new_pos[1]] = true

    end
  end
end

def display_knight_moves(start, target)
  path = knight_moves(start, target)
  puts "You made it in #{path.length - 1} moves! Here's your path:"
  path.each { |pos| puts pos.inspect }
end

# Ejemplos de uso
display_knight_moves([0, 0], [1, 2]) # Output: [[0, 0], [1, 2]]
display_knight_moves([0, 0], [3, 3]) # Output: [[0, 0], [2, 1], [3, 3]] o [[0, 0], [1, 2], [3, 3]]
display_knight_moves([3, 3], [0, 0]) # Output: [[3, 3], [1, 2], [0, 0]] o [[3, 3], [2, 1], [0, 0]]
display_knight_moves([0, 0], [7, 7]) # Output: [[0, 0], [2, 1], [4, 2], [6, 3], [4, 4], [6, 5], [7, 7]] o variaciones similares
