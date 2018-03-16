require "pry"

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
    # Build a class constructor Song.create that initializes a song and
    # saves it to the @@all class variable either literally or
    # through the class method Song.all. This method should return the
    # song instance that was initialized and saved.

    song = self.new
    Song.all << song
    song

  end

  def self.new_by_name(song_name)
  # instantiates a song with a name property
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    # instantiates and saves a song with a name property
    song = self.new
    song.name = song_name
    self.all << song
    song
  end

  def self.find_by_name(song_name)
    # can find a song present in @@all by name
    target = self.all.select{|song| song.name == song_name}
    target[0]
  end

  def self.find_or_create_by_name(song_name)
    # invokes .find_by_name and .create_by_name instead of repeating code
    target = self.find_by_name(song_name)
    if target
      target
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    # returns all the song instances in alphabetical order by song name
    self.all.sort{|song1, song2| song1.name <=> song2.name}
  end

  def self.new_from_filename(filename)
    # initializes a song and artist_name based on the filename format
    # Example: "Thundercat - For Love I Come.mp3"
    array1 = filename.split(".")
    array2 = array1[0].split(" - ")

    artist = array2[0]
    song = array2[1]

    #array2 works: [0] is song name and [1] is artist

    # the problem must be in the instantiation of the class!

    new_song = Song.new
    new_song.name = song

    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(filename)
    # initializes and saves a song and artist_name based on the filename format
    array1 = filename.split(".")
    array2 = array1[0].split(" - ")

    artist = array2[0]
    song = array2[1]

    #above this line works

    # following code is not instantiating a class:
    # NoMethodError:
    #   undefined method `name' for nil:NilClass

    new_song = self.create_by_name(song)
    

    # once correctly instantiated, the below code should work
    new_song.artist_name = artist
    new_song

  end

  def self.destroy_all
    @@all = []
  end


end
