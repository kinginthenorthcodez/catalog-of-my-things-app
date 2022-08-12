require_relative '../file/read_write'
require_relative './music'

def create_music_album
   puts "Is album on spotify? Y or N"
   on_spotify = parse_bool
   puts 'Enter published date'
   published_date = gets.chomp
   puts 'Is album archived'
   archived = parse_bool

   music = MusicAlbum.new(on_spotify, published_date, archived)
   read_write = ReadWrite.new(MusicAlbum)
          .add_file({
            type: music.class.to_s,
            on_spotify: on_spotify, 
            published_date: published_date,
            archived: archived,
          })     
end


def display_list(data)
  puts "1. on_spotify: #{data['on_spotify']}\n2. published date: #{data['published_date']}\n3. archived: #{data['archived']}\n"
end