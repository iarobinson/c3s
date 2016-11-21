class Piece

  def initialize

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
