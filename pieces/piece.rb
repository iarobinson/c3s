class Piece
  attr_accessor :current_pos

  def initialize(color, pos)
    @color = color
    @current_pos = pos
  end

  def to_s
    self.symbol.to_s
  end

  def empty?
    self.class == NullPiece
  end

  def symbol

  end

  def valid_moves

  end

  def move_into_check(to_pos)

  end

end
