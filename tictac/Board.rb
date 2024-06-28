class Board
  WINNING_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], # Horizontal
    [0, 3, 6], [1, 4, 7], [2, 5, 8], # Vertical
    [0, 4, 8], [2, 4, 6]             # Diagonal
  ]

  def initialize
    @cells = Array.new(9, nil)
  end

  def display
    puts " #{@cells[0] || 1} | #{@cells[1] || 2} | #{@cells[2] || 3} "
    puts "---+---+---"
    puts " #{@cells[3] || 4} | #{@cells[4] || 5} | #{@cells[5] || 6} "
    puts "---+---+---"
    puts " #{@cells[6] || 7} | #{@cells[7] || 8} | #{@cells[8] || 9} "
  end

  def update(position, marker)
    @cells[position - 1] = marker
  end

  def valid_move?(position)
    position.between?(1,9) && @cells[position - 1].nil?
  end

  def full?
    @cells.all?
  end

  def winning_marker
    WINNING_COMBINATIONS.each do |combo|
      if combo.all? {|index| @cells[index] == 'X'}
        return 'X'
      elsif combo.all? { |index| @cells[index] == "O" }
        return "O"
      end
    end

    return nil
  end

end
