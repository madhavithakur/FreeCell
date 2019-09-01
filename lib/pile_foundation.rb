require_relative "pile"

class Foundation < Pile
  def self.all_foundations
    Card.suits.map { |suit| Foundation.new(suit) }
  end

  attr_reader :suit

  def initialize(suit, cards = [])
    @suit = suit
    @cards = cards
  end

  def complete?
    count == 13 && @cards.all? {|card| card.suit.eql?(suit)}
  end

  def to_s
    empty? ? "[ #{Card::SUIT_STRINGS[suit]}]" : "[#{top_card}]"
  end

  def valid_move?(card)
    if empty? 
       card.suit.eql?(suit) && card.value == :ace
    else
       card.suit.eql?(suit) && card.rank == top_card.rank + 1
    end
  end
end
