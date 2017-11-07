
WIN_COMBINATIONS = [ # Constant stores ordered list (nested array) with index values representing tic tac toe winning combinations.

  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Middle row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Diagnol left
  [6,4,2] # Diagnol right
  ]


def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def input_to_index(input)
  input.to_i - 1
  # input = gets.strip.to_i
end


def move(board, index, position)
  valid_move?(board, index) && board[index] = position
end


# if b = won?(board)
#   board[b.first]
# end
# end


# it 'allows "X" player in the bottom right and "O" in the top left ' do
#   board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
#   move(board, 0, "O")
#   move(board, 8, "X")
#
#   expect(board).to eq(["O", " ", " ", " ", " ", " ", " ", " ", "X"])
# end
# end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ") # returns true or false based on whether that position on the board has been filled
end


def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end


def turn(board)
  puts "Welcome to Tic Tac Toe! Please enter 1-9:"
  input = gets.strip.to_i
  index = input_to_index(input)

  if valid_move?(board, index)
    move(board, index, "X")
    display_board(board)
    #  board[index] = input
  else
    puts "Invalid move, try again!"
    turn_count(board)
    turn(board)
  end
end


def turn_count(board)
  count = 0 # Variable keeps track of number of turns
  board.each do |b|  # Iterates over each member of the board array
  if count <= 9 &&  b == "X" || b == "O" # checks to see if that element is an "X" or an "O"
    count += 1 # If true, increments our counter variable by 1.
  end
end
  count
end


  # count # Returns the number of turns that have been played.
# end


def current_player(board) # Current_player method takes in an argument of the game board
  turn_count(board).even? ? board = "X" : board = "O"
end


def won?(board) # won? method accepts a board as an argument
  WIN_COMBINATIONS.detect do |w| # iterates over the possible win combinations defined in WIN_COMBINATIONS
  board[w[0]] == board[w[1]] && board[w[2]] == board[w[0]] && position_taken?(board, w[0]) # checks if the board has the same player token in each index of a winning combination
  end
end


def full?(board)
  board.all? do |b|
  b == "X" || b == "O" #returns true if every element in the board contains either an "X" or an "O"
  end
end


def draw?(board)
  full?(board) && !won?(board) # returns true if the board has not been won and is full, returns false if the board is not won and the board is not full, and returns false if the board is won.
end


def over?(board)
  full?(board) || draw?(board) || won?(board) # returns true if the board has been won, is a draw, or is full.
end


def winner(board)
  if b = won?(board)
    board[b.first]
  end
end


def play(board)
  until !over?(board) ==  draw?(board) 
    turn(board)
  end
  if winner(board)
    puts "Congratulations X!"
    puts "Congratulations O!"
  else draw?(board)
    puts "Cat's Game!"
  end
end
  # puts move(board, index, token = "X") && display_board(board)

  # expect(board).to match_array(["X", "O", "X", " ", " ", " ", " ", " ", " "])
#
#   for input in 1..10 do
#
#     over?(board)
#
#   if draw?(board) != won?(board)
#     puts "Cat's game!"
#
#     # winner(board)
#   end
#   # end
# end
