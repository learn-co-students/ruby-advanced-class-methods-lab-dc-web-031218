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
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect{|person| person.name == name}
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name)
    self.find_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|person| person.name}
  end

  def self.new_from_filename(filename)
    artist_and_name = filename.split(" - ")
    artist = artist_and_name[0]
    song_name = artist_and_name[1][0...-4]
    song = self.new
    song.name = song_name
    song.artist_name = artist
    song

  end

  def self.create_from_filename(filename)
    artist_and_name = filename.split(" - ")
    artist = artist_and_name[0]
    song_name = artist_and_name[1][0...-4]
    song = self.new
    song.name = song_name
    song.artist_name = artist
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end


end
