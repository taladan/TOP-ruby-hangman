require "yaml"
require "./lib/hangman.rb"
require "./lib/display"

$display = nil

def load?()
  output = ""
  until output =~ /^[plPL]$/
    system("clear") || system("cls")
    $display.screen_center(
      "Would you like to [P]lay a new game or [L]oad a saved game?",
    )
    output = gets.chomp
  end
  output.downcase == "l"
end

def load()
  dir_name = "sav"
  output = nil

  if Dir.exist?(dir_name)
    choice = nil
    files = Dir.entries(dir_name)
    %w[. ..].each { |element| files.delete(element) }
    $display.center_align(files, true)

    until (0..files.length).include?(choice)
      $display.x_center("Please choose a game to load: ")
      choice = gets.chomp.to_i
    end

    picked_file = files[choice]
    file_location = dir_name + "/" + picked_file
    File.open(file_location, "r") { |file| output = YAML.load_stream(file)[0] }
  else
    $display.screen_center("No save data found.")
  end
  return output
end

def play_again?()
  output = ""
  until output.downcase =~ /^[yn]$/
    $display.x_center("Play again (y/n)? ")
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
  $display = Display.new()
  if load?
    game_data = load()
  else
    game_data = Hash.new(false)
  end
  game = Hangman.new($display, game_data)
end

main()
