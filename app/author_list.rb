require_relative './author'
require 'json'
require 'fileutils'

module AuthorList
  def add_author(item = '')
    print 'First Name: '
    first_name = gets.chomp
    print "\n"
    print 'Last Name: '
    last_name = gets.chomp
    puts 'Author added succefully!'

    author = Author.new(first_name, last_name)
    author.add_item(item) if item.class.to_s == 'Game'

    author_object = { first_name: first_name, last_name: last_name }
    data = File.read('author.json') if File.exist?('author.json')
    file_data = JSON.parse(data)
    file_data << author_object
    File.write('author.json', JSON.generate(file_data))
  end

  def list_author
    p ' Authors list'
    File.write('author.json', []) unless File.exist?('author.json')
    data = File.read('author.json') if File.exist?('author.json')
    authors = JSON.parse(data)
    authors.each_with_index do |author, index|
      puts "#{[index + 1]} Name : #{author['first_name']} #{author['last_name']}"
    end
    print " \n"
    puts 'Create an Author [Y/N]'
    option = parse_bool
    while option
      add_author
      puts 'Continue..? [Y/N]'
      option = parse_bool
    end
  end
end
