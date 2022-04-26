require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


puts "---------------------------------------------------"
puts "| Bienvenue sur le meilleur jeux d'action au monde |"
puts "|   Réussi à survivre pour avoir une chocolatine   |"
puts "---------------------------------------------------"

# --------- initialisation joueur humain ----------- 
def init_fight
  puts "Rentre ton plus beau pseudo :"
  name = gets.chomp
  puts "Salut #{name}"

  my_game = Game.new(name)
  while my_game.is_still_ongoing?
    my_game.menu
    my_game.menu_choice
    puts "-----------------"
	  my_game.show_players
    puts "-----------------"
	  my_game.ennemies_attack
    puts "-----------------"
	  my_game.show_players
    puts "-----------------"
  end
  my_game.end
end  

init_fight




