require_relative 'board'
class Game
  def initialize
    @board = Board.new
  end

  def play
    while true
      raise "You win!" if @board.checkmate?
      @board.render
      selected_piece_position = get_piece
      selected_piece_destination = get_destination
      @board.move_piece!(selected_piece_position, selected_piece_destination)
    end
  end

  def get_piece
    p "Enter location of piece you'd like to move (ex: 1,1):  "
    return gets.chomp.split(',').map(&:to_i)
  end

  def get_destination
    p "Enter destination of piece (ex: 1,1):  "
    return gets.chomp.split(',').map(&:to_i)
  end

end

game = Game.new
game.play
