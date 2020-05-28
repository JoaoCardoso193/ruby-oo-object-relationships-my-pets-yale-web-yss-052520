require_relative 'dog.rb'
require_relative 'cat.rb'
require 'pry'

class Owner
  attr_accessor :cats, :dogs
  attr_reader :name, :species

  @@all = []

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def initialize(name, species = 'human')
    @name = name
    @species = species
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end
  
  def cats
    Cat.all.select { |cat| cat.owner == self}
  end

  def dogs
    Dog.all.select { |dog| dog.owner == self}
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
    # self.cats
  end

  def buy_dog(dog_name)
    # binding.pry
    Dog.new(dog_name, self)
    # self.dogs
  end

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = 'happy'
    end
  end

  def feed_cats
    self.cats.each do |cat|
      cat.mood = 'happy'
    end
  end

  def sell_pets
    cats.each do |cat|
      cat.owner = nil
      cat.mood = 'nervous'
    end

    dogs.each do |dog|
      dog.owner = nil
      dog.mood = 'nervous'
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end