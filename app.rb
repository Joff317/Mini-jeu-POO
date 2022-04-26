require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Anakin")
player2 = Player.new("Yoda")

puts "Voici le status des deux joueurs :"
player1.show_state
player2.show_state
puts "-------------------------------------"



while player1.life_points > 0 && player2.life_points > 0 do
  puts "----- Passons à la phase d'attaque -----"
  player1.attack(player2)
  break if player2.life_points <= 0
  player2.attack(player1)
  break if player1.life_points <= 0

 puts "----------------------------------"

 puts "Voici le status actuel des deux joueurs"
 puts "----------------------------------"
 player1.show_state
 player2.show_state
 puts " "
end

binding.pry