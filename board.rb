require_relative 'piece'
require 'byebug'
class NoPieceThere < StandardError; end
class NotYourPiece < StandardError; end

class Board 
  attr_accessor :board

  def self.empty_grid
    Array.new(7){Array.new(7)}
  end

  def self.from_file(filename)
    rows = File.readlines(filename).map(&:chomp)
    pieces = rows.map do |row|
      # debugger
      chars = row.split("")
      chars.map { |char| Piece.new(char) }
    end

    self.new(pieces)
    # debugger
  end

  def initialize(board = Board.empty_grid)
    @board = board
  end

  def display
    puts "  #{(0..7).to_a.join(' ')}"
    board.each_with_index do |row, i|
      print "#{i}"
      row.each do |col|
        print " #{col.value}"
      end
      puts
    end
  end

  def valid_move?
    return true
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @board[row][col] = val
  end

end 