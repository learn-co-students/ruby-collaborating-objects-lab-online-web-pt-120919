require 'pry'
class Artist 
  attr_accessor :name, :songs
  @@all = []
 
  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end 
  
  def self.all 
    @@all 
  end
  
  def songs 
    Song.all.select {|song| song.artist == self}
  end 
  
  def add_song(song)
    song.artist = self
  end 
  
  def self.find(artist_name)
    @@all.find {|artist| artist.name == artist_name}
    
  end 
  
  def self.create(artist_name)
    artist = self.new(artist_name)
    artist
  end
  
  def self.find_or_create_by_name(name)
    self.find(name) || self.create(name)
  end
  
  def print_songs
    songs.each {|song| puts song.name}
  end
end 
      
    