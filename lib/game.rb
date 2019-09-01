require_relative "card"
require "byebug"

class Game
  attr_reader :free_cells, :foundations, :tableau, :move_history

  def initialize
    @free_cells = Array.new(4) { FreeCell.new }
    @foundations = Foundation.all_foundations
    @tableau = Array.new(8) { Tableau.new }
    deal_tableau
    @move_history = []
    # ...
  end

  def deal_tableau
    cards = Card.all_cards
    while !cards.empty?
    #  debugger
      tableau.each do |pile|
        pile << cards.delete(cards.sample)
        if cards.count == 0
          break
        end
      end
    end
  end

  def move!(from_pile, to_pile)
    to_pile << from_pile.draw
  end

  def move(from_pile, to_pile)
    raise "Move is invalid" unless valid_move?(from_pile, to_pile)
    move!(from_pile, to_pile)
    @move_history << [from_pile, to_pile]
  end

  def undo_move
    raise "No Moves have been made" unless !move_history.empty?
    last_move = @move_history.pop
    move!(last_move.last, last_move.first)
  end

  def valid_move?(from_pile, to_pile)
    return false if from_pile.empty?
    to_pile.valid_move?(from_pile.top_card)
  end

  def won?
    foundations.all? {|foundation| foundation.count == 13}
  end
end
