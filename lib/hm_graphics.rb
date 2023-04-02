# lib/hm_graphics.rb
require "io/console"

module Graphics
  pad = " " * ((IO.console.winsize[1] - 16) / 2)
  @@ascii = [
    pad + "\t      +-----+\n" + pad + "\t           ||\n" + pad +
      "\t           ||\n" + pad + "             ||\n" + pad +
      "             ||\n" + pad + "  \\          ||\n" + pad +
      "  =====---======\n" + pad + "  |            |\n" + pad +
      "  |            |\n" + pad + "  |            |\n" + pad +
      "  |            |\n",
    pad + "\t      +-----+\n" + pad + "\t      |    ||\n" + pad +
      "\t           ||\n" + pad + "             ||\n" + pad +
      "             ||\n" + pad + "  \\          ||\n" + pad +
      "  =====---======\n" + pad + "  |            |\n" + pad +
      "  |            |\n" + pad + "  |            |\n" + pad +
      "  |            |\n",
    pad + "\t      +-----+\n" + pad + "\t      |    ||\n" + pad +
      "\t      O    ||\n" + pad + "             ||\n" + pad +
      "             ||\n" + pad + "  \\          ||\n" + pad +
      "  =====---======\n" + pad + "  |            |\n" + pad +
      "  |            |\n" + pad + "  |            |\n" + pad +
      "  |            |\n",
    pad + "\t      +-----+\n" + pad + "\t      |    ||\n" + pad +
      "\t      O    ||\n" + pad + "        |    ||\n" + pad +
      "             ||\n" + pad + "  \\          ||\n" + pad +
      "  =====---======\n" + pad + "  |            |\n" + pad +
      "  |            |\n" + pad + "  |            |\n" + pad +
      "  |            |\n",
    pad + "\t      +-----+\n" + pad + "\t      |    ||\n" + pad +
      "\t      O    ||\n" + pad + "       /|    ||\n" + pad +
      "             ||\n" + pad + "  \\          ||\n" + pad +
      "  =====---======\n" + pad + "  |            |\n" + pad +
      "  |            |\n" + pad + "  |            |\n" + pad +
      "  |            |\n",
    pad + "\t      +-----+\n" + pad + "\t      |    ||\n" + pad +
      "\t      O    ||\n" + pad + "       /|\\   ||\n" + pad +
      "             ||\n" + pad + "  \\          ||\n" + pad +
      "  =====---======\n" + pad + "  |            |\n" + pad +
      "  |            |\n" + pad + "  |            |\n" + pad +
      "  |            |\n",
    pad + "\t      +-----+\n" + pad + "\t      |    ||\n" + pad +
      "\t      O    ||\n" + pad + "       /|\\   ||\n" + pad +
      "       /     ||\n" + pad + "  \\          ||\n" + pad +
      "  =====---======\n" + pad + "  |            |\n" + pad +
      "  |            |\n" + pad + "  |            |\n" + pad +
      "  |            |\n",
    pad + "\t      +-----+\n" + pad + "\t      |    ||\n" + pad +
      "\t      O    ||\n" + pad + "       /|\\   ||\n" + pad +
      "       / \\   ||\n" + pad + "  /          ||\n" + pad +
      "  =====   ======\n" + pad + "  |            |\n" + pad +
      "  |            |\n" + pad + "  |            |\n" + pad +
      "  |            |\n",
  ]

  def self.ascii
    @@ascii
  end
end
