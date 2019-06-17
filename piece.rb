class Piece
  attr_accessor :value

  def initialize(piece)
    @value = piece
  end 

  def to_s
    return " " if value == 0
  end 

end 
