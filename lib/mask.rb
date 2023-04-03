# lib/mask.rb

class Mask
  attr_accessor :secret
  attr_reader :word
  def initialize(word)
    @word = word
    @secret = "_" * word.length
  end

  def replace_index(indices, character)
    indices.each { |i| @secret[i] = character }
  end
end
