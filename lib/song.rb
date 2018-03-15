class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(given)
    song = self.new
    song.name = given
    song
  end

  def self.create_by_name(given)
    song = self.new
    song.name = given
    song.save
    song
  end

  def self.find_by_name(given)
    all.detect{|song| song.name == given}
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(given)
    #all.none?{|song|song.name == given} ? self.create_by_name(given) : self.find_by_name(given)
    find_by_name(given) == nil ? create_by_name(given) : find_by_name(given)
  end

  def self.alphabetical
    all.sort_by{|song|song.name}
  end

  def self.new_from_filename(file)
    song = self.new
    file_name = file.split(/ - |.mp3/)
    song.name = file_name.last
    song.artist_name = file_name.first
    song
  end

  def self.create_from_filename(file)
    song = self.new
    file_name = file.split(/ - |.mp3/)
    song.name = file_name.last
    song.artist_name = file_name.first
    song.save
    song
  end


  def self.destroy_all
    all.clear
  end


  def save
    self.class.all << self
  end

end
