
class Game 
  attr_accessor :human_player, :ennemies

  def initialize(name)
    @human_player = HumanPlayer.new(name)
    bot_1 = Player.new("Luffy")
    bot_2 = Player.new("Zoro")
    bot_3 = Player.new("Kaido")
    bot_4 = Player.new("Sangoku")
    @ennemies = [bot_1, bot_2, bot_3, bot_4]
  end

  def kill_player(arr_enemies)
  return arr_enemies.reject{|joueur| joueur.life_points <= 0}
  end

  def is_still_ongoing?
    if @human_player.life_points > 0 && @ennemies.length > 0
      return true 
    elsif @human_player.life_points <= 0 || @ennemies.length <= 0
      return false 
    end
  end

  def show_players
    puts "--------------------------------"
    puts "#{@human_player.show_state}"
    puts "il reste #{@ennemies.count} bots"

  end

  def menu
    puts "----------------"
    puts "a - chercher une meilleure arme "
    puts "b - chercher à se soigner"
    puts "--------------------------------"
    puts "Choisi un ennemi parmis tous"
    # on veut afficher les ennemies 
    puts "--------------------------------"
    for n in 0..3
      print "#{n}"
      ennemies[n].show_state
    end
  end


  def menu_choice
    action = gets.chomp
    for n in 0..3
      case action
      when "a"
        @human_player.search_weapon
        break
      when "b"
        @human_player.search_health_pack
        break  
      when "#{n}"
        @human_player.attack(ennemies[n])
      end
    end
    kill_player(self.ennemies)
  end

  def ennemies_attack
    ennemies.each do |ennemi|
      if ennemi.life_points > 0
        ennemi.attack(@human_player)
      end
     end
  end

  def end 
    if @human_player.life_points > 0 && @ennemies.length == 0
      puts "BRAVO TU LES AS TOUS EU!!!"
    else @human_player.life_points == 0 && @ennemies.length > 0
      puts "Tu as perdu aie aie aie aie, tu t'es fais avoir par des bots looser"
    end
  end
 
end