require_relative 'player'
require_relative 'cursor'
require 'colorize'
require 'byebug'

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
    @cursor = Cursor.new([0,0], board)
  end

  def play
    while true
      render(@board)
      @cursor.get_input
      if @cursor.selected_pos
        @board.move_piece!(@cursor.selected_pos, @cursor.cursor_pos)
      end
    end
  end

  def render(board)
    system('clear')
    board.grid.each_with_index do |line, y|
      # print "#{8 - y} | "
      line.each_with_index do |el, x|

        if el.nil?
          if y.odd?
            if x.odd?
              pos = " " + SYMBOLS[:wsquare] + " "
            else
              pos = " " + SYMBOLS[:bsquare] + " "
            end
          else
            if x.odd?
              pos = " " + SYMBOLS[:bsquare] + " "
            else
              pos = " " + SYMBOLS[:wsquare] + " "
            end
          end
          pos = pos.colorize(:red) if @cursor.cursor_pos == [x, y]
          print pos
        else
          sym = SYMBOLS[el.symbol]

          # debugger

          if @cursor.cursor_pos == [x, y]
            sym = sym.colorize(:red)
          end

          if @cursor.selected_pos == [x, y]
            sym = sym.colorize(:blue)
          end

          print " #{sym} "
        end
      end
      puts
    end
    print @cursor.cursor_pos
    print @cursor.selected
    print @cursor.selected_pos
    # puts "     A  B  C  D  E  F  G  H"
  end
end
