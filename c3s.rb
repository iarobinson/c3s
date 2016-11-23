require_relative 'board'
require_relative 'display'

class Game
  def initialize(name1, name2)
    @board = Board.new
    @player1 = Player.new(name1, 'black')
    @player2 = Player.new(name2, 'white')
    @current_player = @player1
    @new_display = Display.new(@board)
  end

  def play
    # while true
      raise "You win!" if @board.checkmate?
      @new_display.play
      take_turn
      switch_players!
    # end
  end

  def take_turn
    if valid_move?

    else

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
end


game = Game.new("Alpha", "Omega")
game.play
