class Board
  attr_reader :grid

  def initialize
    @grid = self.class.create_grid
    set_board
  end

  def set_board
    8.times do |pwn|
      self[pwn, 1] = Pawn.new(black)
      self[pwn, 6] = Pawn.new(white)
    end
    #self[0, 7], self[7, 7] = Rook.new(white)
    self[0, 0], self[7, 0] = Rook.new(black)
    #self[1, 7], self[6, 7] = Knight.new(white)
    #self[1, 0], self[6, 0] = Knight.new(black)
    #self[2, 7], self[5, 7] = Bishop.new(white)
    #self[2, 0], self[5, 0] = Bishop.new(black)
    self[3, 7] = King.new(white)
    #self[4, 7] = Queen.new(white)
    #self[3, 0] = King.new(black)
    #self[4, 0] = Queen.new(black)
  end

  def self.create_grid
    Array.new(8) { Array.new(8) }
  end

  def [](pos)
    x, y = pos[0], pos[1]
    grid[x][y]
  end

  def []=(pos, piece)
    x, y = pos[0], pos[1]
    grid[x][y] = piece
  end

  def dup

  end

  def move_piece(color, from_pos, to_pos)

  end

  def move_piece!(from_pos, to_pos)

  end

  def checkmate?

  end

  def find_king(color)

  end

end
