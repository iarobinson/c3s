require_relative 'player'
#require_relative 'cursor'

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
    :bpawn => '♟',
    :wsquare => '□',
    :bsquare => '■'
  }
  def initialize(board)
    @board = board
    #@cursor = Cursor.new([0,0], board)
  end

  def render(board)
    board.grid.each_with_index do |line, y|
      print "#{8 - y} | "
      line.each_with_index do |el, x|

        if el.nil?
          print " #{x}#{y} "
        #   if y.odd?
        #     if x.odd?
        #       print " " + SYMBOLS[:wsquare] + " "
        #     else
        #       print " " + SYMBOLS[:bsquare] + " "
        #     end
        #   else
        #     if x.odd?
        #       print " " + SYMBOLS[:bsquare] + " "
        #     else
        #       print " " + SYMBOLS[:wsquare] + " "
        #     end
        #   end
        else
          print " " + SYMBOLS[el.symbol] + " "
        end
      end
      puts
    end
    puts "     -----------------------"
    puts "     A  B  C  D  E  F  G  H"
  end

end
