require_relative "guess"
require_relative "hm_graphics"
require_relative "mask"
require "pry-byebug"

class Hangman
  include Graphics
  def initialize()
    @grph = Graphics.ascii
    @turns = @grph.length
    @wrong_guesses = 0
    @word = get_word()
    @header = "Now playing Hangman!"
    @prompt = "Please choose a letter: "
    @mask = Mask.new(@word)
    @guess = Guess.new(@word)
  end

  def start()
    game_loop()
  end

  private

  def process_guess(result)
    if result != nil
      player_guess, player_guess_opts = result.first
      @wrong_guesses += 1 unless player_guess_opts[:is_correct]
      if player_guess_opts[:is_correct]
        @mask.replace_index(
          player_guess_opts[:indices_to_replace],
          player_guess,
        )
      else
        puts center("There are no #{player_guess.upcase}'s in the word.")
        sleep(1)
      end
    else
      puts center("You've already guessed that letter.")
      sleep(1)
    end
  end

  def game_loop()
    win_state = false
    while @wrong_guesses < @turns && !win_state
      win_state = true if @mask.secret == @mask.word
      if win_state
        @mask.secret = @mask.word
        display(@mask.secret, nil)
        puts center("You win!")
        break
      end
      display(@mask.secret, @guess.already_guessed)
      process_guess(@guess.check(prompt(@mask.secret)))
      puts center("The word was: #{@mask.word}")
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

  def update_screen(guesses)
    # puts Graphics.pad(@header.length) + @header
    line_pad(3)
    puts center(@header)
    line_pad(2)
    display_current()
    line_pad(3)
    # puts Graphics.pad(@instructions.length) + @instructions
    puts center("You have #{@turns - @wrong_guesses} guesses left.")
    line_pad(2)
    puts center(@mask.secret.split("").join(" "))
    line_pad(1)
    puts center("Letters tried: #{guesses.keys}") if guesses
    line_pad(1)
  end

  def display(secret, guesses)
    system("clear") || system("cls")
    update_screen(guesses)
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
    word.chomp
  end
end
