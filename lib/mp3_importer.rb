class MP3Importer
  
  attr_accessor :path
  
  def initialize(filepath)
    @path = filepath
  end
  
  def files
    files = Dir[@path + "/*.mp3"]
    songs = []
    files.map{|file| songs << (file.split("mp3s/")[1])}
    songs
  end
  
  def import
    list_of_filenames = files
    list_of_filenames.each{|filename| Song.new_by_filename(filename)}
    
    
  end
  
end