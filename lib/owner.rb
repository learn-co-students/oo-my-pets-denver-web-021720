require 'pry'
class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name,species="human")
    @name = name
    @species = species
    @@all << self
  end

  def say_species
    p "I am a #{@species}."
  end
  
  def self.all
    @@all
  end

  def self.count
    self.all.size
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(name)
    cats << Cat.new(name,self)
  end

  def buy_dog(name)
    dogs << Dog.new(name,self)
  end

  def walk_dogs
    dogs.map do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    cats.map do |cat|
      cat.mood = "happy"
    end
  end

  def pets
    dogs.concat(cats)
  end

  def sell_pets
    pets.map do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def list_pets
    p "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

end