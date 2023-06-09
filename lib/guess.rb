# lib/guess.rb

class Guess
  attr_accessor :wrong_guesses
  attr_reader :already_guessed
  def initialize(word)
    @word = word
    @already_guessed = Hash.new { 0 }
    @wrong_guesses = 0
  end

  def check(character)
    if character.downcase == "save" || character.downcase == "exit"
      output = character.downcase
    elsif @already_guessed.has_key?(character)
      output = nil
    elsif @word.include?(character)
      output = {
        character => {
          is_correct: true,
          indices_to_replace:
            (0...@word.length).find_all do |index|
              @word[index, 1] == character
            end,
        },
      }
      @already_guessed[character] = output[character]
    else
      output = { character => { is_correct: false, indices_to_replace: nil } }
      @already_guessed[character] = output[character]
    end
    output
  end
end
