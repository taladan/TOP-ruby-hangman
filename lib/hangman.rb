require_relative "guess"
require_relative "hm_graphics"
require_relative "mask"

class Hangman
  # Remove me.
  # attr_accessor :word
  include Graphics
  def initialize()
    @grph = Graphics.ascii
    @turns = @grph.length - 1
    @wrong_guesses = 0
    @word = get_word()
    @header = "Now playing Hangman!"
    @prompt = "Please choose a letter: "
  end

  def start()
    game_loop(Mask.new(@word), Guess.new(@word))
  end

  def game_loop(mask, guesses)
    while @wrong_guesses < @turns
      display(mask.secret)
      result = guesses.check(prompt(mask.secret))
      if result != nil
        guess, guess_opts = result.first
        @wrong_guesses += 1 unless guess_opts[:is_correct]
        if guess_opts[:is_correct]
          mask.replace_index(guess_opts[:indices_to_replace], guess)
        end
      else
        puts center("You've already guessed that letter.")
        sleep(2)
      end
    end
  end

  def prompt(secret)
    line_pad(1)
    guess = nil
    until guess =~ /^[a-zA-Z]$/
      print center(@prompt)
      guess = gets.chomp
    end
    guess
  end

  def display(secret)
    system("clear") || system("cls")
    # puts Graphics.pad(@header.length) + @header
    line_pad(3)
    puts center(@header)
    line_pad(2)
    display_current()
    line_pad(3)
    # puts Graphics.pad(@instructions.length) + @instructions
    puts center("You have #{@turns - @wrong_guesses} guesses left.")
    line_pad(2)
    puts center(secret.split("").join(" "))
    line_pad(3)
  end

  def center(text)
    output = Graphics.pad(text.length) + text
    output
  end

  def display_current()
    puts @grph[@wrong_guesses]
  end

  def line_pad(int)
    puts "\n" * int
  end

  def check_guess(guess)
  end

  def save()
  end

  def load()
  end

  def get_word()
    lower = 6
    upper = 12
    word_array = Array.new()
    File
      .foreach("google-10000-english-no-swears.txt")
      .each do |line|
        word_array.push(line) if line.length.between?(lower, upper)
      end
    word = word_array.sample()
    word
  end
end
