require "io/console"
require 'byebug'

KEYMAP = {
  " " => :space,
  "h" => :left,
  "j" => :down,
  "k" => :up,
  "l" => :right,
  "w" => :up,
  "a" => :left,
  "s" => :down,
  "d" => :right,
  "\t" => :tab,
  "\r" => :return,
  "\n" => :newline,
  "\e" => :escape,
  "\e[A" => :up,
  "\e[B" => :down,
  "\e[C" => :right,
  "\e[D" => :left,
  "\177" => :backspace,
  "\004" => :delete,
  "\u0003" => :ctrl_c,
}

MOVES = {
  left: [-1, 0],
  right: [1, 0],
  up: [0, -1],
  down: [0, 1]
}

class Cursor

  attr_reader :cursor_pos, :board, :selected, :selected_pos, :destination_point

  def initialize(cursor_pos, board)
    @cursor_pos = cursor_pos
    @selected_pos = nil # I think this should be our variable
    @board = board
    @destination_point = nil # I think we should delete this
  end

  def get_input
    key = KEYMAP[read_char]
    handle_key(key)
  end

  private

  def read_char
    STDIN.echo = false # stops the console from printing return values

    STDIN.raw! # in raw mode data is given as is to the program--the system
                 # doesn't preprocess special characters such as control-c

    input = STDIN.getc.chr # STDIN.getc reads a one-character string as a
                             # numeric keycode. chr returns a string of the
                             # character represented by the keycode.
                             # (e.g. 65.chr => "A")

    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil # read_nonblock(maxlen) reads
                                                   # at most maxlen bytes from a
                                                   # data stream; it's nonblocking,
                                                   # meaning the method executes
                                                   # asynchronously; it raises an
                                                   # error if no data is available,
                                                   # hence the need for rescue

      input << STDIN.read_nonblock(2) rescue nil
    end

    STDIN.echo = true # the console prints return values again
    STDIN.cooked! # the opposite of raw mode :)

    input
  end

  def handle_key(key)
    case key
    when :return
      toggle_selected(@cursor_pos)
      destination_point(@selected_pos, @destination_point)
      @cursor_pos #returns current position
    when :space
      toggle_selected(@cursor_pos)
      @cursor_pos #returns current position
    when :ctrl_c
      Process.exit(0) #Will exit game and return you to normal terminal input.
    when :up, :down, :left, :right
      if within_range?(MOVES[key])
        update_pos(MOVES[key])
      end

      return nil
    end
  end

  def within_range?(diff)
    new_x = @cursor_pos[0] + diff[0]
    new_y = @cursor_pos[1] + diff[1]
    return true if new_x.between?(0, 7) && new_y.between?(0, 7)
    false
  end

  def update_pos(diff)
    @cursor_pos[0] += diff[0]
    @cursor_pos[1] += diff[1]
  end

# ## this will call select data
#   def select_data # This will send selection data to board
#     # @selected_pos
#   end

  def destination_point(pos, destination_point) ## I think we should delete this
    board.move_piece!(@selected_pos, @destination_point)
  end

  def toggle_selected(pos) # I think we should delete this
    # debugger
    if @selected_pos
      @selected_pos = nil
    else
      @selected_pos = pos.dup
    end
  end
end
