class Player

  attr_reader :player, :question
  attr_accessor :hp

  def initialize(number)
    @player = "player #{number}"
    @hp = 3
  end

  def status
    "#{@player} #{self.lost? ? "has lost!" : "HP:#{@hp}/3" }"
  end

  def lost?
    @hp == 0
  end

  def lose_life
      @hp -= 1
  end
end
