require 'set'

class Game
  def initialize
    @word = ''
    @guesses = Array.new
    @oportunities = 0
  end

  def play
    @word = get_word_to_guess.gsub!("\n", '')
    @oportunities = 10
    display(0)

    for i in (1..10) do
      @guesses.push(get_guess)
      display(i)
      if (check_win?)
        puts "You win"
        return
      end
    end
    puts 'You lose'
  end

  def check_win?
    word_set = @word.chars.to_set
    guesses_set = @guesses.to_set
    word_set.subset?(guesses_set)
  end

  def display(oportunitie)
    puts "Intento: #{oportunitie + 1}"
    @word.chars.each do |char|
      print @guesses.include?(char) ? char : "_"
    end
    puts
  end

  def get_guess
    puts 'Ingrese su intento'
    gets.chomp
  end

  def get_word_to_guess
    words = File.readlines('words.txt')
    breakpoint = rand(1..2946)
    words.each_with_index do |word, index|
      if (index == breakpoint)
        return word
      end
    end
  end
end
