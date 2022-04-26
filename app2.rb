require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "---------------------------------------------------"
puts "| Bienvenue sur le meilleur jeux d'action au monde |"
puts "|   Réussi à survivre pour avoir une chocolatine   |"
puts "---------------------------------------------------"

# --------- initialisation joueur humain ----------- 
puts "Rentre ton plus beau pseudo :"
name = gets.chomp
puts "Salut #{name}"
user = HumanPlayer.new(name)

# --------- initialisation bots ennemies -----------
player1 = Player.new("José")
player2 = Player.new("Josiane")
player_array = [player1, player2]

# --------- Le combat ----------

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)  
  puts "------------------"
  puts  "Voici l'état actuel du joueur humain"

    user.show_state
    puts "--------------------"
puts "Voici l'état actuel des bots :"
    
    if player1.life_points > 0
      puts player1.show_state
    else player1.life_points < 0
        puts player1.show_state
    end
    if player2.life_points > 0
      puts player2.show_state
    else player1.life_points < 0
      puts player1.show_state
    end
 puts "----------------------"   
 # ---------- Menu de décision ----------
puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme "
    puts "b - chercher à se soigner"
puts "Attaquer un joueur en vue "
    puts "0 - attaquer José  "
    puts "1 - attaquer Josianne "
#CHOIX
    action = gets.chomp 

   if action == "a"
    user.search_weapon 
   elsif action == "b"
    user.search_health_pack
   elsif action == "0"
    user.attack(player1)
   elsif action == "1"
    user.attack(player2)
   end

   #contre-attaque des ennemies ahahahah
  if player1.life_points > 0 || player2.life_points > 0
    puts "-------------------------------------------"
   puts "C'est maintenant au tour des bots d'attaquer"

   player_array.each do |player|
    if player.life_points > 0
      player.attack(user)
    end
   end
  end

  if player1.life_points <= 0 && player2.life_points <= 0
    puts "Bravo tu as massacré ces pauvres bots sans défense!"
  end
end