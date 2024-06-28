class Player
  attr_reader :marker, :name

  def initialize(name, marker)
    @name = name
    @marker = marker
  end

  def get_move
    puts "#{name}, introduce una posicion (1-9): "
    return gets.chomp.to_i
  end
end
