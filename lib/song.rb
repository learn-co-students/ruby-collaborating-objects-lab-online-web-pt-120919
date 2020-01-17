class Song
  
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def artist_name=(artist)
    @artist = Artist.find_or_create_by_name(artist)
  end
  
  def self.new_by_filename(filename)
    filename = filename.split('.mp3')[0].split(' - ')
    song = Song.new(filename[1])
    song.artist_name = filename[0]
    song.genre = filename[2]
    song
  end
  
  def self.all
    @@all
  end
  
end
