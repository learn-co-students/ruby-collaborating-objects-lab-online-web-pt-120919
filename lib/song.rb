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
  
  def self.new_by_filename(file) 
    new_song = file.split(" - ") 
    new_song_name = new_song[1]
    new_artist_name = new_song[0] 
    song = self.new(new_song_name) 
    song.artist_name = new_artist_name
    song
  end 

  def artist_name=(name) 
    self.artist = Artist.find_or_create_by_name(name) 
    self.artist.add_song(self) 
  end
  
  
end