# require_relative ''

class Display

  SYMBOLS = {
    :wking => '♔',
    :wqueen => '♕',
    :wrook => '♖',
    :wbishop => '♗',
    :wknight => '♘',
    :wpawn => '♙',
    :bking => '♚',
    :bqueen => '♛',
    :brook => '♜',
    :bbishop => '♝',
    :bknight => '♞',
    :bpawn => '♟'
  }
  def initialize(board)
    @board = board
  end

  def render(board)
    board.grid.each do |line|
      line.each do |el|
        if el.nil?
          print " O "
        else
          print " " + SYMBOLS[el.symbol] + " "
        end
      end
      puts
    end
  end

end
