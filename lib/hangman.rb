require_relative "guess"
require_relative "hm_graphics"
require_relative "mask"
require "pry-byebug"

class Hangman
  include Graphics
  def initialize()
    @grph = Graphics.ascii
    @turns = @grph.length - 1
    @word = get_word()
    @header = "Now playing Hangman!"
    @prompt = "Please choose a letter: "
    @mask = Mask.new(@word)
    @guess = Guess.new(@word)
  end

  def start()
    response = play_or_load()
    if response == "p"
      game_loop()
    else
      game_data = load()
    end
  end

  private

  def play_or_load()
    output = nil
    until output =~ /^[plPL]$/
      system("clear") || system("cls")
      puts y_center(
             x_center(
               "Would you like to [P]lay a new game or [L]oad a saved game?",
             ),
           )
      output = gets.chomp
    end
    output
  end

  def process_guess(result)
    if result != nil
      player_guess, player_guess_opts = result.first
      if player_guess_opts[:is_correct]
        @mask.replace_index(
          player_guess_opts[:indices_to_replace],
          player_guess,
        )
      else
        @turns -= 1
        puts x_center("There are no #{player_guess.upcase}'s in the word.")
        sleep(1)
      end
    else
      puts x_center("You've already guessed that letter.")
      sleep(1)
    end
  end

  def game_loop()
    win_state = false
    loose_state = false
    while @turns > 0 && !win_state
      win_state = true if @mask.secret == @mask.word
      if win_state
        @mask.secret = @mask.word
        display(@mask.secret, nil)
        puts x_center("You win!")
        break
      end
      display(@guess.already_guessed)
      process_guess(@guess.check(prompt(@mask.secret)))
    end
    if !win_state && @turns == 0
      display(@guess.already_guessed)
      puts x_center("The word was: #{@mask.word}")
    end
  end

  def prompt(secret)
    line_pad(1)
    guess = nil
    until guess =~ /^[a-zA-Z]$/
      print x_center(@prompt)
      guess = gets.chomp
    end
    guess
  end

  def update_screen(guesses)
    # puts Graphics.pad(@header.length) + @header
    line_pad(3)
    puts x_center(@header)
    line_pad(2)
    display_current()
    line_pad(3)
    # puts Graphics.pad(@instructions.length) + @instructions
    puts x_center("You have #{@turns} guesses left.")
    line_pad(2)
    puts x_center(@mask.secret.split("").join(" "))
    line_pad(1)
    puts x_center("Letters tried: #{guesses.keys}") if guesses
    line_pad(1)
  end

  def display(guesses)
    system("clear") || system("cls")
    update_screen(guesses)
  end

  def display_current()
    puts @grph[@turns]
  end

  def x_center(text)
    output = Graphics.x_pad(text.length) + text
    output
  end

  def y_center(text)
    output = Graphics.y_pad(1) + text
    output
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
