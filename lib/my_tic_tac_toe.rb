require 'pry'
require 'io/console'

class TicTacToe

    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_input)
        keypad(user_input.to_i) - 1
    end

    def keypad(num)
        if num.between?(1, 3)
            num += 6
        elsif num.between?(7, 9)
            num -+ 6
        else
            num
        end
    end

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
        return false unless @board[index] == "X" || @board[index] == "O"
        true
    end

    def valid_move?(position)
        !position_taken?(position) && position.between?(0, 8)
    end

    def turn_count
        @board.filter.with_index { |spot, index| position_taken?(index) }.length
    end

    def current_player
        turn_count.even? ? "X" : "O"
    end

    def turn(output = "Please enter a num correlating to a tic tac toe space  on the num keypad")
        puts output
        user_input = STDIN.getch
        index = input_to_index(user_input)
        if valid_move?(index)
            move(index, current_player)
            display_board
        else
            turn("Please enter a valid number (1-9)")
        end
    end

    def won?
        WIN_COMBINATIONS.find do |combo|
            position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
        end
    end

    def full?
        true unless @board.find { |spot| spot == ' ' }
    end

    def draw?
        full? && !won?
    end

    def over?
        won? || draw?
    end

    def winner
        if won?
            @board[won?[0]]
        end
    end

    def play(player_1, player_2)
        display_board
        turn until over?
        if draw?
            puts "Draw!"
        else
            result = winner == "X" ? player_1 : player_2
            puts "Congratulations #{result}!"
        end
    end

end