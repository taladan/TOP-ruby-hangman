# lib/mask.rb

class Mask
  attr_accessor :secret
  def initialize(word)
    @word = word
    @secret = "_" * word.length
  end

  def replace_index(index, character)
    @secret[index] = character
  end
end
