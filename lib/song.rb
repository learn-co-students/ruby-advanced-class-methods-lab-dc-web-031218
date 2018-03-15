require 'pry'


class Song

  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    temp = Song.new
    temp.save
    temp
  end

  def self.new_by_name(name)
    temp = Song.new
    temp.name = name
    temp
  end

  def self.create_by_name(name)
    temp = self.create
    temp.name = name
    temp
  end

  def self.find_by_name(name)
    self.all.detect{|person| person.name == name}
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name)
    self.find_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|person| person.name}
  end

  def self.new_from_filename(file)
    parts = file.split(" - ")
    name = parts[1].split(".")[0]
    artist = parts[0]
    temp = self.new_by_name(name)
    temp.artist_name = artist
    temp
    #binding.pry
  end

  def self.create_from_filename(file)
    parts = file.split(" - ")
    name = parts[1].split(".")[0]
    artist = parts[0]
    #binding.pry
    temp = self.create_by_name(name)
    temp.artist_name = artist
  end

  def self.destroy_all
    self.all.clear
  end

end
