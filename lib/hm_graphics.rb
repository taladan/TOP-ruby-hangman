# lib/hm_graphics.rb
require "io/console"

module Graphics
  def self.pad(num)
    pad = " " * ((IO.console.winsize[1] - num) / 2)
    pad
  end

  pad = pad(16)
  @@ascii = [
    pad + "        +-----+\n" + pad + "             ||\n" + pad +
      "             ||\n" + pad + "             ||\n" + pad +
      "             ||\n" + pad + "  \\          ||\n" + pad +
      "  =====---======\n" + pad + "  |            |\n" + pad +
      "  |            |\n" + pad + "  |            |\n" + pad +
      "  |            |\n",
    pad + "        +-----+\n" + pad + "        |    ||\n" + pad +
      "             ||\n" + pad + "             ||\n" + pad +
      "             ||\n" + pad + "  \\          ||\n" + pad +
      "  =====---======\n" + pad + "  |            |\n" + pad +
      "  |            |\n" + pad + "  |            |\n" + pad +
      "  |            |\n",
    pad + "        +-----+\n" + pad + "        |    ||\n" + pad +
      "        O    ||\n" + pad + "             ||\n" + pad +
      "             ||\n" + pad + "  \\          ||\n" + pad +
      "  =====---======\n" + pad + "  |            |\n" + pad +
      "  |            |\n" + pad + "  |            |\n" + pad +
      "  |            |\n",
    pad + "        +-----+\n" + pad + "        |    ||\n" + pad +
      "        O    ||\n" + pad + "        |    ||\n" + pad +
      "             ||\n" + pad + "  \\          ||\n" + pad +
      "  =====---======\n" + pad + "  |            |\n" + pad +
      "  |            |\n" + pad + "  |            |\n" + pad +
      "  |            |\n",
    pad + "        +-----+\n" + pad + "        |    ||\n" + pad +
      "        O    ||\n" + pad + "       /|    ||\n" + pad +
      "             ||\n" + pad + "  \\          ||\n" + pad +
      "  =====---======\n" + pad + "  |            |\n" + pad +
      "  |            |\n" + pad + "  |            |\n" + pad +
      "  |            |\n",
    pad + "        +-----+\n" + pad + "        |    ||\n" + pad +
      "        O    ||\n" + pad + "       /|\\   ||\n" + pad +
      "             ||\n" + pad + "  \\          ||\n" + pad +
      "  =====---======\n" + pad + "  |            |\n" + pad +
      "  |            |\n" + pad + "  |            |\n" + pad +
      "  |            |\n",
    pad + "        +-----+\n" + pad + "        |    ||\n" + pad +
      "        O    ||\n" + pad + "       /|\\   ||\n" + pad +
      "       /     ||\n" + pad + "  \\          ||\n" + pad +
      "  =====---======\n" + pad + "  |            |\n" + pad +
      "  |            |\n" + pad + "  |            |\n" + pad +
      "  |            |\n",
    pad + "        +-----+\n" + pad + "        |    ||\n" + pad +
      "        O    ||\n" + pad + "       /|\\   ||\n" + pad +
      "       / \\   ||\n" + pad + "  /          ||\n" + pad +
      "  =====   ======\n" + pad + "  |            |\n" + pad +
      "  |            |\n" + pad + "  |            |\n" + pad +
      "  |            |\n",
  ]

  def self.ascii
    @@ascii
  end
end
