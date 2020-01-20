class Artist 
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end 
  
  def self.all
    @@all
  end 
  
  def add_song(song)
    song.artist = self 
  end 
  
  def songs
    Song.all.select {|song| song.artist == self}
  end 
  
  def self.find_or_create_by_name(artist)
    found_artist = self.all.find {|entry| entry.name == artist}
    found_artist.nil? ? self.new(artist) : found_artist
  end 
    
  def print_songs
    songs.each {|song| puts song.name}
  end 
end



  