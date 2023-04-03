# lib/guess.rb

# @already_guessed = {
#   "a":
#   {is_correct:true,
#     indices_to_replace:[0,1,2]
#     }
#   "b":
#   {is_correct:false,
#   indices_to_replace:nil
# }
#   }

class Guess
  attr_reader :already_guessed
  def initialize(word)
    @word = word
    @already_guessed = {}
  end

  def check(character)
    #need guard clause to only accept alphabet characters
    if @already_guessed.has_key?(character)
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
