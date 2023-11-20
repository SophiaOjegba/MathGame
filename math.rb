class MathGame
  def initialize(player1, player2)
    @players = [player1, player2]
    @current_player = @players[0]
    @player_two = @players[1]
  end

  def generate_question
    num1 = rand(1..20)
    num2 = rand(1..20)
    { question: "#{@current_player.name}: What is #{num1} + #{num2}?", answer: num1 + num2 }
  end

  def switch_player
    @current_player = (@current_player == @players[0] ? @players[1] : @players[0])
  end

  def play
    loop do
      question_info = generate_question
      puts question_info[:question]
      print '> '
      player_answer = gets.chomp.to_i

      if player_answer == question_info[:answer]
        puts "Correct!\n\n"
      else
        puts "Incorrect! #{@current_player.name} loses a life.\n\n"
        @current_player.lose_life
      end

      if @current_player.lives == 0 && @player_two.lives > 0
        puts "#{@player_two.name} Wins the game!"
        break
      end
      if @player_two.lives == 0 && @current_player.lives > 0
        puts "#{@current_player.name} Wins the game!"
        break
      end

      switch_player
    end
  end
end
