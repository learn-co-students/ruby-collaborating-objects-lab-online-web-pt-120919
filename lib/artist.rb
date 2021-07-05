class Artist
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def songs
    @songs
  end

  def print_songs()
    @songs.each do |song|
      puts song.name
    end
  end

  def add_song_by_name(name)
    song = Song.new(name)
    add_song(song)
  end

  def self.find_or_create_by_name(name)
    new_artist = nil
    @@all.each do |artist|
      if artist.name == name
        new_artist = artist
      end
    end
    if !new_artist
      new_artist = Artist.new(name)
    end
    new_artist
  end

  def self.song_count()
    Song.all.length()
  end

  def self.all()
    @@all
  end
end