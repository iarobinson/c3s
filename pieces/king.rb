require_relative 'piece'

class King < Piece
  attr_reader :color, :symbol

  def initialize(color, pos)
    super(color, pos)
    color == "black" ? @symbol = :bking : @symbol = :wking
  end

  # def move(pos)
  #   self.current_pos = pos
  #
  # end

end
