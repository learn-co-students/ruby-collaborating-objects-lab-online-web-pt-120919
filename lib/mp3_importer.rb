class MP3Importer
  attr_accessor :path
  
  @@files = []
  
  def initialize(file_path)
    @path = file_path
  end 
  
  def files
    @@files = Dir.children(@path)
  end
  
  def import
    files.each {|file| Song.new_by_filename(file)}
  end 
    
end 