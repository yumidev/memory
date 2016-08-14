require 'pry'
require_relative 'card'

class Board

  CARD_VALUES = [
    '😎', '🤖', '🐨'
  ]

  def initialize
    @grid = []
  end

  def populate
    cards=[]
    CARD_VALUES.each do |val|
      2.times { cards.push(Card.new(val)) }
    end
    @grid = cards.shuffle
  end

  def render
    @grid.each_with_index do |card, i|
      p i.to_s + ': ' + card.display
    end
  end

  def won?
    @grid.all? do |card|
      card.face_up
    end
  end

  def reveal (guessed_pos)
    card = @grid[guessed_pos]
    if card.face_up
      return
    else
      card.reveal
      puts card.value
    end
  end

  def hide (pos)
    @grid[pos].hide
  end

  def same_card? (pos1, pos2)
    @grid[pos1] == @grid[pos2]
  end
end
