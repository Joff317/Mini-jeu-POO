class Player
  attr_accessor :name, :life_points

  #on initialise Player avec son nom et ses points de vie
  def initialize(name)
    @name = name
    @life_points = 10
  end

  #Montre l'état du Player
  def show_state
    if @life_points <= 0 
        puts " - 💀💀💀 #{@name} is dead 💀💀💀"
    else
        puts " - #{@name} - #{@life_points} pv" 
    end
  end

  #Inflige des dêgats et regarde si les bots sont en vie ou ont été tué
  def gets_damage(damages)
    @life_points = @life_points - damages

    if @life_points <= 0 
      puts "#{name} à été tué"
    end
  end

  # Player lance une attaque et regarde les dêgats infligé
  def attack(player)
   puts "#{name} attaque #{player.name}"
   damages_inflicted = compute_damages
   player.gets_damage(damages_inflicted)
   if player.life_points > 0
    puts "Le joueur #{name} à infligé #{damages_inflicted} de dommages"
   end
  end

  def compute_damages
    return rand(1..6)
  end
end

#Héritage => on créer un joueur humain
class HumanPlayer < Player
  attr_accessor :weapon_level

  #on lui attribue une arme
  def initialize(name)
    @weapon_level = 1
  ##on lui attribue des points de vie supérieur aux bots
    super 
    @life_points = 100
  end

  #on regarde l'êtat du joueur humain et le lvl de son arme
  def show_state
    if @life_points <= 0
      puts " - 💀💀💀 #{@name} est mort 💀💀💀"
    else 
        puts puts " - #{@name} - #{@life_points} pv"
    end
  end


  #on multiplie les dêgats au niveau de l'arme trouvée
  def compute_damage
    rand(1..6) * @weapon_level
  end

  #Possibilité de changer d'armes de niveau 1 à 6 
  def search_weapon
    weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{weapon_level}"
    if weapon_level > @weapon_level
      @weapon_level = weapon_level
     puts "Amazing, t'es un boss, tu as un don, tu as trouvé une meilleur arme" 
    else 
       puts "M@*#$... elle n'est pas mieux que ton arme actuelle.."
    end
  end

  #Possibilité de se soigner en cherchant un pack de soin 
  def search_health_pack
    lp_random = rand(1..6)
    if lp_random == 1
      puts "Tu n'as rien trouvé"
    end
    if lp_random >= 2 && lp_random <= 5 
     @life_points = @life_points + 50 #ajoute 50 lp mais ne dépasse pas les 100
      if @life_points > 100
        @life_points = 100
      end
      puts "Bravo tu as trouvé un pack de +50 points de vie, tu est vraiment le meilleur joueur du monde" 
    end
    if lp_random == 6
       @@life_points = life_points + 80 #Ajoute 80 mais ne dépasse pas les 100
      if @life_points > 100
        @life_points = 100
      end
      puts "Wow tu as un don!! tu as trouvé un pack de + 80 points de vie"
    end
  end
end