class Song
  @@all = []

  attr_accessor :name,:artist

  def initialize(song_name)
    @name = song_name
    @@all << self
  end

  def self.all
    @@all
  end
  
  def self.new_by_filename(file_name=nil)
    song_data = file_name.split(" - ")
    artist = song_data[0]
    song_name = song_data[1]
    
    song_obj = Song.new(song_name)
    artist_obj = Artist.find_or_create_by_name(artist)
    
    song_obj.artist = artist_obj
    
    song_obj
  end
  
  def artist_name=(name)
    artist_obj = Artist.find_or_create_by_name(name)
    self.artist = artist_obj
  end
  
  
end