# lib/display.rb
require "pry-byebug"

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
    puts y_center(x_center(text.to_s))
  end

  def center_align(array, with_indexes = false)
    length = array.max_by(&:length).length
    if with_indexes
      array.each_with_index do |element, index|
        puts x_center("[#{index}] - #{element}", length)
      end
    else
      array.each { |element| puts x_center("#{element}") }
    end
  end

  def x_center(text, length = 0)
    if length > 0
      puts Graphics.x_pad(length) + text.to_s
    else
      puts Graphics.x_pad(text.length) + text.to_s
    end
  end

  def y_center(text)
    puts Graphics.y_pad(1) + text.to_s
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
    puts x_center(
           "You can also type 'save' or 'exit' to either save or leave your game.",
         )
    line_pad(1)
  end

  def display_current(game_data)
    puts game_data[:grph][game_data[:turns]]
  end
end
