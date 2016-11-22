require_relative 'piece'

class NullPiece < Piece
  include Singleton
  attr_reader :symbol

  def initialize
  end

  # def move(pos)
  #   self.current_pos = pos
  #
  # end

end
