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
  	song = Song.new
  	@@all << song
  	song 
  end

  def self.new_by_name (to_name)
  	song = Song.new
  	song.name = to_name
  	song

  end

  def self.create_by_name(to_name)
  	song = Song.new
  	song.name = to_name
  	@@all << song
  	song
  end


  #Finds if a song is present in @@all[]
  def self.find_by_name(name)
  	self.all.select{|song| song.name == name}[0]
  end

  #Finds name, if not found, create new song
  def self.find_or_create_by_name(name)
  	to_return = self.find_by_name(name)
  	if !to_return
  		to_return = self.create_by_name(name)
  	end 
  	to_return
  end

  #Return all song instances in alphabetical order
  def self.alphabetical
  	self.all.sort_by{|song| song.name}
  end

  #Create file from format: Artist - Song.mp3
  def self.new_from_filename(str)
  	str.slice!".mp3"
  	temp = str.split(" - ")
  	song = self.create_by_name(temp[1])
  	song.artist_name = temp[0]
  	song 
  end

  def self.create_from_filename(str)
  	self.new_from_filename(str)
  end

  def self.destroy_all
  	self.all.clear
  end

end

str = "Thundercat - For Love I Come.mp3"
song_1 = Song.create_by_name("Thriller")  
song_2 = Song.create_by_name("Blank Space")  
song_3 = Song.create_by_name("Call Me Maybe")

#binding.pry

puts "Hello"