require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    @@all << self.new
    @@all.last
  end

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    @@all << new_song
    new_song
  end

  def self.find_by_name(song_name)
    @@all.detect {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
    new_song = self.new
    new_song.artist_name = file.split(" -")[0]
    new_song.name = file.split(" - ")[1].split(".")[0]
    new_song
  end

  def self.create_from_filename(file)
    if !self.find_by_name(file.split(" - ")[1].split(".")[0])
      @@all << self.new_from_filename(file)
    end
  end

  def self.destroy_all
    @@all = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
end

Song.new_from_filename("Taylor Swift - Blank Space.mp3")
