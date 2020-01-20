class Artist
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs= []
    @@all << self
  end

  def add_song(song)
    @songs << song
    # song.artist = self
    # song
  end

  def songs
    Song.all.each do |s|
      if s.artist == self
        @songs << s
      end
    end
    @songs
  end

  # def save
  #   @@all << self
  #   self
  # end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    self.all.detect {|artist| artist.name == name} || Artist.new(name)
  end

  def print_songs
    self.songs.each {|song| puts song.name} 
   end
end