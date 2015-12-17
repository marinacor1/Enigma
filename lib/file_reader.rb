class FileReader

  def read
    filename = ARGV[0]
    File.read(filename)
  end

  def writes(text)
    output_file = File.open(ARGV[1], 'w')
    output_file.write(text)
  end

end
