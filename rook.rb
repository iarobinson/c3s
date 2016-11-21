class Rook < Piece
  attr_reader :color, :symbol

  def initialize(color)
    @color = color
    @symbol = :rook
  end
  

end
