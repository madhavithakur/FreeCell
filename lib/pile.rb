class Pile
  attr_reader :cards

  def initialize(cards = [])
    @cards = cards
  end

  def empty?
    count < 1
  end

  def draw
    raise "Pile is Empty" unless !empty?
    cards.pop
  end

  def count
    cards.count
  end

  def top_card
    cards.last
  end

  # implement this method in each of the Pile subclasses
  def valid_move?(card)
    raise "Not yet implemented!"
  end

  def <<(card)
    cards << card
  end
end
