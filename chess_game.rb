require_relative 'board'
require_relative 'player'
require_relative 'cursor'

require 'colorize'

class NoPieceThere < StandardError; end
class NotYourPiece < StandardError; end

class ChessGame
  attr_accessor :board, :current_player
                                                           
  def self.from_file(filename)
    board = Board.from_file(filename)
    self.new(board)
  end

  def initialize(board)
    @board = board
    @check_mate = false
    @player_1 = Player.new("white")
    @player_2 = Player.new("black")
    @current_player = @player_1
  end 

  def play
    until check_mate?
      system('clear')
      board.display
      move_piece(current_player)
      turn(current_player)
    end
  end

  def turn(current_player)
    if current_player == @player_1
      @current_player = @player_2
    else
      @current_player = @player_1
    end
  end

  def move_piece(player)
    begin
      puts "give the X & Y axis of the piece you would like to move: (like so: X,Y) "
      orig_space = gets.chomp.split(',').map(&:to_i)
      if board[orig_space].value == ' '
        raise NoPieceThere
      end

      puts "give the X & Y axis of where you would like to move the #{board[orig_space].value} to: "
      moved_space = gets.chomp.split(',').map(&:to_i)
      board[orig_space], board[moved_space] = board[moved_space], board[orig_space]
    rescue NoPieceThere
      puts "That is not a possible starting move"
      retry
    rescue NotYourPiece
      puts 'That is your opponents piece'
      retry
    end
  end

  def check_mate?
    return false
  end

end

chess_board = ChessGame.from_file('piece.txt')

chess_board.play