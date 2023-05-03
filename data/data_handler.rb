require 'json'

def write_data(obj, filename)
  json_data = JSON.generate(obj.map(&:to_h))
  File.write(filename, json_data)
end

def read_data(filename)
  return [] unless File.exist?(filename) && File.size(filename) != 0

  JSON.parse(File.read(filename))
end
