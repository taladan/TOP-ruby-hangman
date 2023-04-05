require "yaml"
require_relative "guess"
require_relative "hm_graphics"
require_relative "mask"
require_relative "display"

class Hangman
  include Graphics
  attr_reader :game_over
  def initialize(display, game_data)
    @screen = display
    @grph = game_data[:grph] || Graphics.get_ascii
    @turns = game_data[:turns] || @grph.length - 1
    @word = game_data[:word] || get_word()
    @header = "Now playing Hangman!"
    @prompt = "Please choose a letter: "
    @mask = game_data[:mask] || Mask.new(@word)
    @guess = game_data[:guess] || Guess.new(@word)
    @win_state = false
    @game_over = false
    update_game_data()
    game_loop()
  end

  private

  def update_game_data()
    @game_data = {
      game_over: @game_over,
      grph: @grph,
      guess: @guess,
      header: @header,
      mask: @mask,
      prompt: @prompt,
      turns: @turns,
      win_state: @win_state,
      word: @word,
    }
  end

  def process_guess(result)
    if result == "save"
      save()
    elsif result == "exit"
      quit()
    elsif result != nil
      player_guess, player_guess_opts = result.first
      if player_guess_opts[:is_correct]
        @mask.replace_index(
          player_guess_opts[:indices_to_replace],
          player_guess,
        )
      else
        @turns -= 1
        @screen.x_center("There are no #{player_guess.upcase}'s in the word.")
        sleep(1)
      end
    else
      @screen.x_center("You've already guessed that letter.")
      sleep(1)
    end
  end

  def game_loop()
    while @turns > 0 && !@win_state
      @win_state = true if @mask.secret == @mask.word
      update_game_data()
      if @win_state
        @mask.secret = @mask.word
        @win_state = true
        @game_over = true
        update_game_data()
        @screen.display(@game_data)
        return @game_over
      end
      update_game_data()
      @screen.display(@game_data)
      process_guess(@guess.check(prompt()))
    end
    if !@win_state && @turns == 0
      @game_over = true
      update_game_data()
      @screen.display(@game_data)
      return @game_over
    end
  end

  def prompt()
    @screen.line_pad(1)
    guess = nil
    # until guess =~ /^[a-zA-Z]$/
    until guess =~ /^[a-zA-Z]|[Ss][Aa][Vv][Ee]|[Ee][Xx][Ii][Tt]$/
      print @screen.x_center(@prompt)
      guess = gets.chomp
    end
    guess
  end

  def save()
    savedir = "sav"
    file_name = nil

    until file_name =~ /^[a-zA-Z0-9]+([._-][a-zA-Z0-9]+)*$/
      @screen.x_center(
        "Please enter a valid unix-standard name for save game: ",
      )
      file_name = gets.chomp
    end

    file_name = file_name + ".hms"
    save_location = savedir + "/" + file_name
    Dir.mkdir(savedir) unless Dir.exist?(savedir)
    File.open(save_location, "w") { |to_file| YAML.dump(@game_data, to_file) }
    @screen.screen_center("Game saved to #{save_location}")
    quit()
  end

  def quit()
    @screen.x_center("Thank you for playing!")
    sleep(2)
    exit()
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
