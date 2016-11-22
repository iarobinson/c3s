require_relative 'board'
class Game
  def initialize(name1, name2)
    @board = Board.new
    @player1 = Player.new(name1, 'black')
    @player2 = Player.new(name2, 'white')
    @current_player = @player1
  end

  def play
    while true
      raise "You win!" if @board.checkmate?
      @board.render
      take_turn
      switch_players!
    end
  end

  def take_turn
    selected_piece_position = @current_player.get_piece
    selected_piece_destination = @current_player.get_destination
    if valid_move?
      @board.move_piece!(selected_piece_position, selected_piece_destination)
    else
      take_turn
    end
  end

  def switch_players!
    if @current_player == @player2
      @current_player = @player1
    else
      @current_player = @player2
    end
  end

  def valid_move?
    true
  end

  # def get_piece
  #   p "Enter location of piece you'd like to move (ex: 1,1):  "
  #   return gets.chomp.split(',').map(&:to_i)
  # end
  #
  # def get_destination
  #   p "Enter destination of piece (ex: 1,1):  "
  #   return gets.chomp.split(',').map(&:to_i)
  # end

end

# system("clear")
# puts ("c9s is a chess game. Tell us your name to start playing")
# player1 = gets.chomp
# # Player.new(player1, 'white')
#
# puts ("Ok #{player1}, what's player two's name?")
# player2 = gets.chomp
# # Player.new(player1, 'white')

game = Game.new("Alpha", "Omega")
game.play
