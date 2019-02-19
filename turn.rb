class Turn

  attr_reader :current_player, :next_player

  def initialize(players)
    @players = players.shuffle
    @current_player = nil
    @next_player = nil
    @round = 1
  end

  def playing
    @players.select {|player| !player.lost?}
  end

  def get_current_player
    playing.first
  end

  def get_next_player(current)
    @next_player = playing.select {|player| player != current}.first
  end

  def next_turn
    puts "----- NEW TURN -----"

    @current_player = get_current_player
    @next_player = get_next_player(@current_player)
    @players.rotate!
  end

end
