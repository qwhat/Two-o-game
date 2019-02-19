require_relative './turn'
require_relative './player'
require_relative './question'

class Game

  def initialize
    @player1 = Player.new(1)
    @player2 = Player.new(2)
    @players = [@player1, @player2]
    @question = Question.new(@players)
    @turn = Turn.new(@players)
  end

  def summary
    puts ''
    puts '----- Summary -----'
    puts "#{@players.map {|player|player.status}.join("\n")}"
    puts ''
  end

  def game_over?
    @players.select {|player| !player.lost? }.count == 1
  end

  def end_game

    puts ''
    puts '----- GAME OVER! -----'
    winner = @players.select {|player| !player.lost?}.first
    puts "#{winner.player} has won!"

  end

  def run
    while !game_over?
      @turn.next_turn

      current_player = @turn.current_player
      next_player = @turn.next_player
      correct = @question.question(current_player)

      if !correct
        current_player.lose_life
      end
      sleep 1
      
      summary
      sleep 1
    end

    end_game
  end
end
