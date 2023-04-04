require "./lib/hangman.rb"
require "./lib/display"
require "pry-byebug"

def play_or_load(display)
  output = ""
  until output =~ /^[plPL]$/
    system("clear") || system("cls")
    display.screen_center(
      "Would you like to [P]lay a new game or [L]oad a saved game?",
    )
    output = gets.chomp
  end
  output
end

def save()
end

def load()
end

def play_again?()
  output = ""
  until output.downcase =~ /^[yn]$/
    puts "Play again (y/n)? "
    output = gets.chomp until output.downcase =~ /^[yn]$/
  end
  output == "y"
end

def main()
  replay = true
  while replay
    start()
    replay = play_again?
  end
end

def start()
  display = Display.new()
  response = play_or_load(display)
  game_data = Hash.new(nil)
  if response == "l"
    game_data = load()
  else
    game = Hangman.new(display, game_data)
  end
end

main()
