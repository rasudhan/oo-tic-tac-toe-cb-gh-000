class TicTacToe
  def initalize(board=nil)
    @board = board || Array.new(9," ")
  end

  def play
    turn until over?
    if won?
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts "Cat's Game!"
    end
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
      display_board(board)
    else
      turn(board)
    end
  end

  def current_player
    turn_count.even? ? 'X' : 'O'
  end

  def turn_count
    @board.count {|token| token=='X' || token=='O'}
  end

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



  def won?
    WIN_COMBINATIONS.any? do |combo|
     if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
       return combo
     end
  end

  def full?(board)
     board.all? {|index| index == "X" || index == "O"}
  end

  def draw?(board)
    if full?(board) && !won?(board)
      return true
    else
      return false
    end
  end

  def over?(board)
    if won?(board) || full?(board) || draw?(board)
      return true
    else
      return false
    end
  end

  def winner(board)
    index = []
    index = won?(board)
    if index == false
      return nil
    else
      if board[index[0]] == "X"
        return "X"
      else
        return "O"
      end
    end
  end



end
