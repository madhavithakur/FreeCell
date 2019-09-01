require_relative "pile"

class Tableau < Pile
  def to_s
    empty? ? "[  ]" : "[#{cards.join(', ')}]"
  end

  def valid_move?(card)
    return true if empty?
    if top_card.color == card.color 
      false
    else
      top_card.rank == card.rank + 1
    end
  end
end
