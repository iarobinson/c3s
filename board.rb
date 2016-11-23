require_relative 'pieces/king'
require_relative 'pieces/rook'

class Board
  attr_reader :grid

  def initialize
    @grid = self.class.create_grid
    set_board
  end

  def set_board
    # 8.times do |pwn|
    # self[pwn, 1] = Pawn.new(black)
    #   self[pwn, 6] = Pawn.new(white)
    # end
    #self[0, 7], self[7, 7] = Rook.new(white)
    # self[[2, 2]] = Rook.new("black", [2, 2])
    # self[[0, 7]] = Rook.new("black", [0, 7])
    # self[[1, 7]] = Knight.new("white", [1, 7])
    # self[[1, 0]] = Knight.new("black", [1, 7])
    # self[[2, 7]] = Bishop.new("white", [1, 7])
    # self[[2, 0]] = Bishop.new("black", [1, 7])
    self[[0, 0]] = King.new("white", [0, 0])
    #self[4, 7] = Queen.new(white)
    #self[3, 0] = King.new(black)
    #self[4, 0] = Queen.new(black)
  end

  def self.create_grid
    Array.new(8) { Array.new(8) }
  end

  def [](pos)
    x, y = pos[1], pos[0]
    grid[x][y]
  end

  def []=(pos, piece)
    x, y = pos[1], pos[0]
    grid[x][y] = piece
  end


  def move_piece(color, from_pos, to_pos)
    # i9r <- this is duplicate right?
  end

  def move_piece!(from_pos, to_pos)
    self[from_pos], self[to_pos] = self[to_pos], self[from_pos]
  end

  def checkmate?
    false
  end

  def find_king(color)

  end

end

# if $0 == __FILE__
#   board = Board.new
#   board.render
#   board[[3,7]].pos
# end
