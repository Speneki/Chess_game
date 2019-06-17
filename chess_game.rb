require_relative 'board'

class ChessGame
  attr_accessor :board
                                                           
  def self.from_file(filename)
    board = Board.from_file(filename)
    self.new(board)
  end

  def initialize(board)
    @board = board
  end 

end

chess_board = ChessGame.from_file('piece.txt')

chess_board.board.display
