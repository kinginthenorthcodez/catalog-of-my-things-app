require 'json'
require 'fileutils'
class ReadWrite
  def initialize(type)
    @type = "./file/#{type}.json".downcase # move.json / games.json
  end

  def read_all_records
    File.write(@type, JSON.generate([])) unless File.exist?(@type)
    JSON.parse(File.read(@type))
  end

  def add_file(json_object)
    File.write(@type, JSON.generate([])) unless File.exist?(@type)
    type_list = JSON.parse(File.read(@type)).push(json_object)
    File.write(@type, type_list.to_json)
  end
end
