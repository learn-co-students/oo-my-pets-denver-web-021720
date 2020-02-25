require 'pry'

class Owner
  attr_reader :species, :name
  
  @@all = []

  def initialize name, species = "human"
    @name = name
    @species = species
    
    @@all << self 
  end

  def self.all
    @@all
  end

  def say_species
    "I am a #{self.species}."
  end
  
  def self.count
    all.count
  end

  def self.reset_all
    @@all = []
  end
  
  #returns an array of the cats an owner instance owns
  def cats
    Cat.all.select {|cat| cat.owner == self}
  end
  
  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    self.dogs.each_entry { |dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each_entry { |cat| cat.mood = "happy"}
  end

  def all_pets

  end

  def sell_pets
    self.dogs.each_entry { |dog| dog.mood = "nervous"}
    self.cats.each_entry { |cat| cat.mood = "nervous"}
    self.dogs.each_entry { |dog| dog.owner = nil}
    self.cats.each_entry { |cat| cat.owner = nil}
  end

  def list_pets
    p "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end



