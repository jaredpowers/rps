# User selects rock, paper, or scissors via (r), (p), or (s)
# After user selection there is a randomized computer response pulling from [rock, paper, scissors]
# Then tells who won per format - "Player: ROCK vs Computer: SCISSORS ----- PLAYER WINS"
# Rock beats scissors
# Paper beats Rock
# Scissors beats Paper



class Game
attr_accessor :player_one_choice, :computer, :winner, :winning_choice

def random_choice
  %w(rock paper scissors).sample
end

def random_computer_choice
  self.computer = random_choice
end

def announce_winner
  puts "Player: #{player_one_choice.upcase} vs Computer: #{computer.upcase} ----- #{winner} WINS"
end

def play_again
  puts "play again?  (yes) or (no)"
  response = gets.chomp.downcase
  if response.downcase == "yes"
    self.play
  elsif response.downcase =="no"
    exit
  else
    puts "Please type 'yes' or 'no'"
    self.play_again
  end
end

def reset
  puts "Rock, paper, or scissors?"
  self.winner = nil
  self.player_one_choice = gets.chomp.downcase
  computer = random_computer_choice
end


def game
  while winner == nil
    if player_one_choice == "rock"
      if computer == "rock"
        self.winner = "No one"
      elsif computer =="paper"
        self.winner = "Computer"
      else
        self.winner = "Player"
      end
    elsif player_one_choice == "paper"
      if computer == "rock"
        self.winner = "Player"
      elsif computer =="paper"
        self.winner = "No one"
      else
        self.winner = "Computer"
      end
    elsif player_one_choice =="scissors"
      if computer == "rock"
        self.winner = "Computer"
      elsif computer =="paper"
        self.winner = "Player"
      else
        self.winner = "No one"
      end
    else
      puts "Please choose 'Rock', 'Paper', or 'Scissors'"
      self.player_one_choice = gets.chomp.downcase
    end
  end
end

def play
  self.reset
  self.game
  self.announce_winner
  self.play_again
end
end

game = Game.new
game.play
