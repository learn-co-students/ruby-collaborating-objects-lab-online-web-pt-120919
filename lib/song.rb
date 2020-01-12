class Song 
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @artist = nil
    save
  end

  def save
    @@all << self
  end

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
    return if artist.songs.include?(self)
    artist.songs << self
  end

  def artist_name
    if self.artist
      self.artist.name
    else
      nil
    end
  end

  def artist_name=(name)
    @artist = Artist.find_or_create_by_name(name)
  end

  def self.new_by_filename(filename)
    filename.slice!(".mp3")
    info = filename.split(" - ")
    song = Song.new(info[1])
    song.artist = Artist.find_or_create_by_name(info[0])
    song
  end

  def self.all
    @@all
  end
end 