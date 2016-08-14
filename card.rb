require_relative 'board'

class Card
  attr_accessor :value, :face_up
  def initialize (value)
    @value = value
    @face_up = false
  end

  def display
    face_up ? value : "*"
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def == (another_card)
    self.value == another_card.value
  end
end
