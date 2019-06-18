class Piece
attr_accessor :value, :color

  def initialize(piece)
    black = ['p','k','c','q','k','b','r']
    white = black.map  {|el| el.upcase}
    if black.include?(piece)
      @color = 'black'
    elsif white.include?(piece)
      @color = 'white'
    end

    if piece == 'P'
      @value = '♙'
    elsif piece == 'p'
      @value = '♟'
    elsif piece == 'C'
      @value = '♖'
    elsif piece == 'c'
      @value = '♜'
    elsif piece == 'R'
      @value = '♘'
    elsif piece == 'r'
      @value = '♞'
    elsif piece == 'B'
      @value = '♗'
    elsif piece == 'b'
      @value = '♝'
    elsif piece == 'Q'
      @value = '♕'
    elsif piece == 'q'
      @value = '♛'
    elsif piece == 'K'
      @value = '♔'
    elsif piece == 'k'
      @value = '♚'
    elsif piece == '0'
      @value = ' '
    end
  end 

end 
