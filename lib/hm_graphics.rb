# lib/hm_graphics.rb
require "io/console"
require "pry-byebug"

module Graphics
  def self.x_pad(num)
    x_pad = " " * ((IO.console.winsize[1] - num) / 2)
    x_pad
  end

  def self.y_pad(lines)
    y_pad = "\n" * ((IO.console.winsize[0] - lines) / 2)
  end

  x_pad = x_pad(16)

  @@ascii = [
    x_pad + "        +-----+\n" + x_pad + "        |    ||\n" + x_pad +
      "        O    ||\n" + x_pad + "       /|\\   ||\n" + x_pad +
      "       / \\   ||\n" + x_pad + "  /          ||\n" + x_pad +
      "  =====    =====\n" + x_pad + "  |            |\n" + x_pad +
      "  |            |\n" + x_pad + "  |            |\n" + x_pad +
      "  |            |\n",
    x_pad + "        +-----+\n" + x_pad + "        |    ||\n" + x_pad +
      "        O    ||\n" + x_pad + "       /|\\   ||\n" + x_pad +
      "       / \\   ||\n" + x_pad + "  \\          ||\n" + x_pad +
      "  =====----=====\n" + x_pad + "  |            |\n" + x_pad +
      "  |            |\n" + x_pad + "  |            |\n" + x_pad +
      "  |            |\n",
    x_pad + "        +-----+\n" + x_pad + "        |    ||\n" + x_pad +
      "        O    ||\n" + x_pad + "       /|\\   ||\n" + x_pad +
      "       /     ||\n" + x_pad + "  \\          ||\n" + x_pad +
      "  =====----=====\n" + x_pad + "  |            |\n" + x_pad +
      "  |            |\n" + x_pad + "  |            |\n" + x_pad +
      "  |            |\n",
    x_pad + "        +-----+\n" + x_pad + "        |    ||\n" + x_pad +
      "        O    ||\n" + x_pad + "       /|\\   ||\n" + x_pad +
      "             ||\n" + x_pad + "  \\          ||\n" + x_pad +
      "  =====----=====\n" + x_pad + "  |            |\n" + x_pad +
      "  |            |\n" + x_pad + "  |            |\n" + x_pad +
      "  |            |\n",
    x_pad + "        +-----+\n" + x_pad + "        |    ||\n" + x_pad +
      "        O    ||\n" + x_pad + "       /|    ||\n" + x_pad +
      "             ||\n" + x_pad + "  \\          ||\n" + x_pad +
      "  =====----=====\n" + x_pad + "  |            |\n" + x_pad +
      "  |            |\n" + x_pad + "  |            |\n" + x_pad +
      "  |            |\n",
    x_pad + "        +-----+\n" + x_pad + "        |    ||\n" + x_pad +
      "        O    ||\n" + x_pad + "        |    ||\n" + x_pad +
      "             ||\n" + x_pad + "  \\          ||\n" + x_pad +
      "  =====----=====\n" + x_pad + "  |            |\n" + x_pad +
      "  |            |\n" + x_pad + "  |            |\n" + x_pad +
      "  |            |\n",
    x_pad + "        +-----+\n" + x_pad + "        |    ||\n" + x_pad +
      "        O    ||\n" + x_pad + "             ||\n" + x_pad +
      "             ||\n" + x_pad + "  \\          ||\n" + x_pad +
      "  =====----=====\n" + x_pad + "  |            |\n" + x_pad +
      "  |            |\n" + x_pad + "  |            |\n" + x_pad +
      "  |            |\n",
    x_pad + "        +-----+\n" + x_pad + "        |    ||\n" + x_pad +
      "             ||\n" + x_pad + "             ||\n" + x_pad +
      "             ||\n" + x_pad + "  \\          ||\n" + x_pad +
      "  =====----=====\n" + x_pad + "  |            |\n" + x_pad +
      "  |            |\n" + x_pad + "  |            |\n" + x_pad +
      "  |            |\n",
    x_pad + "        +-----+\n" + x_pad + "             ||\n" + x_pad +
      "             ||\n" + x_pad + "             ||\n" + x_pad +
      "             ||\n" + x_pad + "  \\          ||\n" + x_pad +
      "  =====----=====\n" + x_pad + "  |            |\n" + x_pad +
      "  |            |\n" + x_pad + "  |            |\n" + x_pad +
      "  |            |\n",
  ]

  @@animation = [
    x_pad + "       +-----+\n" + x_pad + "       |    ||\n" + x_pad +
      "       |    ||\n" + x_pad + "      \\O/   ||\n" + x_pad +
      "       |    ||\n" + x_pad + "      / \\   ||\n" + x_pad +
      " /          ||\n" + x_pad + "=====    =====\n" + x_pad +
      "|            |\n" + x_pad + "|            |\n" + x_pad +
      "|            |\n" + x_pad + "|            |\n",
    x_pad + "       +-----+\n" + x_pad + "       |    ||\n" + x_pad +
      "       |    ||\n" + x_pad + "       |    ||\n" + x_pad +
      "      \\O/   ||\n" + x_pad + "       |    ||\n" + x_pad +
      " /    / \\   ||\n" + x_pad + "=====    =====\n" + x_pad +
      "|            |\n" + x_pad + "|            |\n" + x_pad +
      "|            |\n" + x_pad + "|            |\n",
    x_pad + "       +-----+\n" + x_pad + "       |    ||\n" + x_pad +
      "       |    ||\n" + x_pad + "       |    ||\n" + x_pad +
      "       |    ||\n" + x_pad + "      \\O/   ||\n" + x_pad +
      " /     |/   ||\n" + x_pad + "===== /  =====\n" + x_pad +
      "|            |\n" + x_pad + "|            |\n" + x_pad +
      "|            |\n" + x_pad + "|            |\n",
    x_pad + "       +-----+\n" + x_pad + "       |    ||\n" + x_pad +
      "       |    ||\n" + x_pad + "       |    ||\n" + x_pad +
      "       |    ||\n" + x_pad + "       |    ||\n" + x_pad +
      " /    \\O/   ||\n" + x_pad + "=====  | =====\n" + x_pad +
      "|     / \\    |\n" + x_pad + "|            |\n" + x_pad +
      "|            |\n" + x_pad + "|            |\n",
    x_pad + "       +-----+\n" + x_pad + "       |    ||\n" + x_pad +
      "       |    ||\n" + x_pad + "       |    ||\n" + x_pad +
      "       |    ||\n" + x_pad + "       |    ||\n" + x_pad +
      " /     |    ||\n" + x_pad + "===== \\O======\n" + x_pad +
      "|      |\\    |\n" + x_pad + "|     / \\    |\n" + x_pad +
      "|            |\n" + x_pad + "|            |\n",
    x_pad + "       +-----+\n" + x_pad + "       |    ||\n" + x_pad +
      "       |    ||\n" + x_pad + "       |    ||\n" + x_pad +
      "       |    ||\n" + x_pad + "       |    ||\n" + x_pad +
      " /     |    ||\n" + x_pad + "=====  O =====\n" + x_pad +
      "|     \\ /    |\n" + x_pad + "|      |     |\n" + x_pad +
      "|     / \\    |\n" + x_pad + "|            |\n",
    x_pad + "       +-----+\n" + x_pad + "       |    ||\n" + x_pad +
      "       |    ||\n" + x_pad + "       |    ||\n" + x_pad +
      "       |    ||\n" + x_pad + "       |    ||\n" + x_pad +
      " /     |    ||\n" + x_pad + "=====  O =====\n" + x_pad +
      "|            |\n" + x_pad + "|     \\ /    |\n" + x_pad +
      "|      |     |\n" + x_pad + "|     / \\    |\n",
    x_pad + "       +-----+\n" + x_pad + "       |    ||\n" + x_pad +
      "       |    ||\n" + x_pad + "       |    ||\n" + x_pad +
      "       |    ||\n" + x_pad + "       |    ||\n" + x_pad +
      " /     |    ||\n" + x_pad + "=====  O =====\n" + x_pad +
      "|            |\n" + x_pad + "|            |\n" + x_pad +
      "|     __     |\n" + x_pad + "|   ==--     |\n",
    x_pad + "       +-----+\n" + x_pad + "       |    ||\n" + x_pad +
      "       |    ||\n" + x_pad + "       |    ||\n" + x_pad +
      "       |    ||\n" + x_pad + "       |    ||\n" + x_pad +
      " /     |    ||\n" + x_pad + "=====    =====\n" + x_pad +
      "|     O      |\n" + x_pad + "|            |\n" + x_pad +
      "|     __     |\n" + x_pad + "|   ==--     |\n",
    x_pad + "       +-----+\n" + x_pad + "       |    ||\n" + x_pad +
      "       |    ||\n" + x_pad + "       |    ||\n" + x_pad +
      "       |    ||\n" + x_pad + "       |    ||\n" + x_pad +
      " /     |    ||\n" + x_pad + "=====    =====\n" + x_pad +
      "|            |\n" + x_pad + "|    O       |\n" + x_pad +
      "|     __     |\n" + x_pad + "|   ==--     |\n",
    x_pad + "       +-----+\n" + x_pad + "       |    ||\n" + x_pad +
      "       |    ||\n" + x_pad + "       |    ||\n" + x_pad +
      "       |    ||\n" + x_pad + "       |    ||\n" + x_pad +
      " /     |    ||\n" + x_pad + "=====    =====\n" + x_pad +
      "|            |\n" + x_pad + "|            |\n" + x_pad +
      "|   O __     |\n" + x_pad + "|   ==--     |\n",
    x_pad + "       +-----+\n" + x_pad + "       |    ||\n" + x_pad +
      "       |    ||\n" + x_pad + "       |    ||\n" + x_pad +
      "       |    ||\n" + x_pad + "       |    ||\n" + x_pad +
      " /     |    ||\n" + x_pad + "=====    =====\n" + x_pad +
      "|            |\n" + x_pad + "|            |\n" + x_pad +
      "|     __     |\n" + x_pad + "|  O==--     |\n",
    x_pad + "       +-----+\n" + x_pad + "       |    ||\n" + x_pad +
      "       |    ||\n" + x_pad + "       |    ||\n" + x_pad +
      "       |    ||\n" + x_pad + "       |    ||\n" + x_pad +
      " /     |    ||\n" + x_pad + "=====    =====\n" + x_pad +
      "|            |\n" + x_pad + "|            |\n" + x_pad +
      "|     __     |\n" + x_pad + "| O ==--     |\n",
    x_pad + "       +-----+\n" + x_pad + "       |    ||\n" + x_pad +
      "       |    ||\n" + x_pad + "       |    ||\n" + x_pad +
      "       |    ||\n" + x_pad + "       |    ||\n" + x_pad +
      " /     |    ||\n" + x_pad + "=====    =====\n" + x_pad +
      "|            |\n" + x_pad + "|            |\n" + x_pad +
      "|     __     |\n" + x_pad + "|o  ==--     |\n",
  ]

  def self.get_ascii
    @@ascii
  end

  def self.get_animation
    @@animation
  end
end
