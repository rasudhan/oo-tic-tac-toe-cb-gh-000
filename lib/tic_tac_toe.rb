class TicTacToe
  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS=[
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8], #Bottom row
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
  ]


  def initalize
    @board =Array.new(9," ")
  end

  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end

  # Helper Method
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def input_to_index(index)
    index.to_i-1
  end

  def move(index,token)
    @board[index]=token
  end

  def turn
    puts "Please enter 1-9:"
    input=gets.strip
    index=input_to_index(input)
    if valid_move?(index)
      token=current_player
      move(index,token)
      display_board
    else
      turn
    end
  end

  def current_player
    turn_count.even? ? 'X' : 'O'
  end

  def turn_count
    @board.count {|token| token=='X' || token=='O'}
  end




  def won?
    WIN_COMBINATIONS.any? do |combo|
     if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
       return combo
     end
  end

  def full?
     @board.all? {|index| index == "X" || index == "O"}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if combo = won?
      @board[combo[0]]
    end
  end

end
end
