class MP3Importer 
  attr_accessor :path
  @@files = []
  def initialize(file_path)
    @path = file_path
  end
  
  def files 
    files = Dir.entries(@path)
    files.each do |file|
      @@files << file if file.length > 4
    end
    @@files
  end
  
  def import 
    self.files.each do |file_name|
      Song.new_by_filename(file_name)
    end
  end
end