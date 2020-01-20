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
    @songs << song
  end
  
  def self.find_or_create_by_name(name)
    if self.all.detect{|artist| artist.name == name}
      self.all.detect{|artist| artist.name == name}
    else 
      new_artist = Artist.new(name)
      return new_artist 
    end
  end
  
  def print_songs 
    self.songs.each do |song|
      puts song.name
    end
  end
end