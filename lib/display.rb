# lib/display.rb

class Display
  def initialize()
  end

  def display(game_data)
    if game_data[:game_over] && !game_data[:win_state]
      system("clear") || system("cls")
      update_screen(game_data)
      puts x_center("The word was: #{game_data[:mask].word}")
    else
      system("clear") || system("cls")
      update_screen(game_data)
    end
  end

  def screen_center(text)
    puts y_center(x_center(text))
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

  private

  def update_screen(game_data)
    # puts Graphics.pad(@header.length) + @header
    line_pad(3)
    puts x_center(game_data[:header])
    line_pad(2)
    display_current(game_data)
    line_pad(3)
    # puts Graphics.pad(@instructions.length) + @instructions
    puts x_center("You have #{game_data[:turns]} guesses left.")
    line_pad(2)
    puts x_center(game_data[:mask].secret.split("").join(" "))
    line_pad(1)
    if game_data[:guess]
      puts x_center("Letters tried: #{game_data[:guess].already_guessed.keys}")
    end
    line_pad(1)
  end

  def display_current(game_data)
    puts game_data[:grph][game_data[:turns]]
  end
end
