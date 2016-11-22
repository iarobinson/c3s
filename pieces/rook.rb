require_relative 'piece'

class Rook < Piece
  attr_reader :color, :symbol

  def initialize(color, pos)
    super(color, pos)
    color == "black" ? @symbol = :brook : @symbol = :wrook
  end

end
