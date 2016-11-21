class King < Piece
  attr_reader :color, :symbol

  def initialize(color)
    @color = color
    @symbol = :king
  end

end
