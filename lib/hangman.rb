require_relative "hm_graphics"
class Hangman
  include Graphics
  def initialize()
    @wrong_guesses = 0
    @word = get_word()
    @grph = Graphics.ascii
  end

  def start()
    puts "Now playing hangman!"
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
