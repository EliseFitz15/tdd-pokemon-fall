require_relative 'dice'

class Pokemon
  attr_accessor :name, :type, :ability, :hit_points, :strength
  def initialize(name, type, ability, hit_points = 50)
    @name = name
    @type = type
    @ability = ability
    @hit_points = hit_points
    @strength = die_roll
  end

  def die_roll
    Dice.new(10).roll
  end

  def train
    @strength += die_roll
  end

  def attack!(pokemon)
    pokemon.hit_points - strength / 2
  end

  def alive?
    hit_points > 0
  end
end
