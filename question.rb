
class Question
  def initialize(players)
  end

  def question(current_player)
    num1 = rand(1..100)
    num2 = rand(1..100)
    num3 = num1 + num2

    puts num3 #get rid of this, only for testing
    puts "#{current_player.player}: What does #{num1} + #{num2} equal?"

    print "> "
    answer = $stdin.gets.chomp.to_i
    sleep 1

    if (answer != num3)
      puts "Wow, very wrong!"
      return false
    else
      puts "Correct! Good job!"
      return true
    end

  end
end
