require_relative '../file/read_write'
require_relative './music'
require_relative './genre'

# rubocop:disable Metrics/MethodLength
def create_music_album
  puts 'Is album on spotify? Y or N'
  on_spotify = parse_bool
  puts 'Enter published date'
  published_date = gets.chomp
  puts 'Is album archived'
  archived = parse_bool
  puts 'Enter album genre'
  genre_name = gets.chomp

  music = MusicAlbum.new(on_spotify, published_date, archived)
  ReadWrite.new(MusicAlbum)
    .add_file({
                type: music.class.to_s,
                on_spotify: on_spotify,
                published_date: published_date,
                archived: archived,
                genre: genre_name
              })

  genre = Genre.new(genre_name)
  ReadWrite.new(Genre)
    .add_file({
                type: genre.class.to_s,
                name: genre_name
              })
end

# rubocop:enable Metrics/MethodLength
def display_list(data)
  puts "1. on_spotify: #{data['on_spotify']}\n2. published date: #{data['published_date']}\n
  3. archived: #{data['archived']}\n4. genre: #{data['genre']}"
end

def display_genre(data)
  print "#{data['name']}, "
end
