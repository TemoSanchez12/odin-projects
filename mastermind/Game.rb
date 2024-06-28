require_relative 'Board'

class Game
  def initialize
    @code= generate_code
    @board = Board.new()
  end

  def play
    @board.code = @code
    @board.display
    win = false

    for i in (0..11)
      current_guess = enter_guess
      if check_guess?(current_guess)
        win = true
        break
      end
      @board.set_guess_row(i, current_guess)
      @board.set_guess_feedback(i, get_feedback_guess(current_guess))
      @board.display
    end

    @board.show_code

    puts win ? 'You win' : 'You lose'

  end

  def enter_guess
    guess = Array.new(5)
    for i in (0..4)
      puts "Enter guess for position #{i + 1}"
      guess[i] = gets.chomp.to_i
    end

    return guess
  end

  def generate_code
    (0..4).map { |i| rand(1...8)}
  end

  def check_guess?(guess)
    guess == @code
  end

  def get_feedback_guess (guess)
    feedback = String.new()

    if (guess == @code)

    end

    guess.each_with_index do |number, index|
      if @code.include?(number) && @code[index] == number
        feedback += 'X'
      elsif @code.include?(number)
        feedback += 'O'
      end
    end

    return feedback
  end

end
