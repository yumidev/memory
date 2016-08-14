require_relative 'board'

class Game
  def initialize
    @board = Board.new
    @previous_guess
  end

  def play
    @board.populate
    while !@board.won?
      @board.render
      guessed_pos = gets.chomp.to_i
      @board.reveal(guessed_pos)
      make_guess(guessed_pos)
    end
  end

  def make_guess(pos)
    if @previous_guess
      unless @board.same_card?(@previous_guess, pos)
        @board.hide(pos)
        @board.hide(@previous_guess)
      end
      @previous_guess = nil
    else
      @previous_guess = pos
    end
  end
end

game = Game.new
game.play
