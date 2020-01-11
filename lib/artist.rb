require 'pry'
class Artist

  @@all = []

  attr_accessor :name

  def initialize(artist_song)
    @name = artist_song
    @@all << self
  end

  def self.all
    @@all
  end
  
  def songs
    songs = Song.all.select{|song| song.artist == self}
    songs
  end
  
  def add_song(song)
      song.artist = self
  end
    
  def self.find_or_create_by_name(artist_name)
    artist_obj = Artist.all.find{|artist| artist.name == artist_name}
    if artist_obj == nil
      return Artist.new(artist_name)
    end
    artist_obj
  end
  
  def print_songs
    songs = self.songs
    songs.each{|song| puts song.name}
  end

end