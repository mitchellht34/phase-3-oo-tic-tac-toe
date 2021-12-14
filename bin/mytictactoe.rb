require_relative '../lib/my_tic_tac_toe.rb'
require 'io/console'
require 'pry'

def start_game
    puts "Player 1, enter your name:"
    player_1 = gets.chomp
    puts "Player 2, enter your name:"
    player_2 = gets.chomp
    puts "Press Enter to play a game of Tic Tac Toe"
    enter = gets
    if enter == "\n"
        play_game(player_1, player_2)
    end
end

def play_game(player_1, player_2)
    new_game = TicTacToe.new
    new_game.play(player_1, player_2)
    puts "Press Enter to play again with the same players or space to swap Player 1 and Player 2.\nAnything else will start over with new players"
    again = STDIN.getch
    if again == "\r"
        play_game(player_1, player_2)
    elsif again == " "
        play_game(player_2, player_1)
    else
        start_game
    end
end

start_game