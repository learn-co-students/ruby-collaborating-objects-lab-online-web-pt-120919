class Song 
  attr_accessor :name, :artist
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end 
  
  def self.all
    @@all
  end 
  
  def artist_name=(artist)
    found_artist = Artist.find_or_create_by_name(artist)
    self.artist = found_artist
  end 
  
  def self.new_by_filename(file_name)
    song_name = file_name.split(" - ")[1]
    artist = file_name.split(" - ")[0]
    
    song = self.new(song_name)
    song.artist = Artist.find_or_create_by_name(artist)
    song
  end
end 



