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
  
  def add_song(new_song) 
    new_song.artist = self
  end 
  
  def songs 
    Song.all.select {|song| song.artist == self }
  end
  
  def print_songs 
    Song.all.select do |song| 
      if song.artist == self 
        puts song.name 
      end
    end 
  end


  def self.find(name) 
    self.all.find do |artist| 
      artist.name == name 
    end
  end
  
  def self.create(name) 
    new_artist = self.new(name) 
    self.all << new_artist 
    new_artist
  end 
  
  def self.find_or_create_by_name(artist_name) 
    if self.find(artist_name) 
      self.find(artist_name) 
    else 
      self.create(artist_name) 
    end
  end

  
end
  
  