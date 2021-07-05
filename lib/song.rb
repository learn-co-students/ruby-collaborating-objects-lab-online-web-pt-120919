song class

attr_accessor :name, :song

@@all=[]

end

def self.all
  @all <<self
end

def song.new_by_filename