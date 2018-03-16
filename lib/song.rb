class Song
  attr_accessor :name, :artist_name

# def name=(name)
#   @name = name
# end
#
# def name
#   @name
# end


  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

def self.create
song = self.new
# song.name=(song)
@@all << song
song
end

def self.new_by_name(song)
  new_song = self.new
  new_song.name=(song)
  new_song
end

def self.create_by_name(song)
  new_song = self.new
  new_song.name=(song)
  @@all << new_song
  new_song
end


def self.find_by_name(song)
  self.all.find do |s|
    s.name == song
  end
end

def self.find_or_create_by_name(song)
  if !self.find_by_name(song)
    self.create_by_name(song)
  else
    self.find_by_name(song)
  end
end


def self.alphabetical
  self.all.sort_by {|song| song.name}
end


def self.new_from_filename(song)
  new_artist_name = song.split("-")[0].split.join(" ")
  new_song_name = song.split("-")[1].split(".")[0].split.join(" ")
  song_added = self.create_by_name(new_song_name)
  song_added.artist_name=(new_artist_name)
  song_added
end

def self.create_from_filename(song)
  new_artist_name = song.split("-")[0].split.join(" ")
  new_song_name = song.split("-")[1].split(".")[0].split.join(" ")
  song_added = self.create_by_name(new_song_name)
  song_added.artist_name=(new_artist_name)
  song_added
end

def self.destroy_all
  @@all = []
end


end
