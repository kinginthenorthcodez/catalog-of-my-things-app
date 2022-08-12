require_relative '../app/file/read_write.rb'

def create_music_album
   puts "Is album on spotify? Y or N"
   on_spotify = parse_bool
   puts 'Enter published date'
   published_date = gets.chomp
   puts 'Is album archived'
   archived = parse_bool

   music = MusicAlbum.new(on_spotify, published_date, archived)
   read_write = ReadWrite.new('MusicAlbum')
          .add_file({
            on_spotify: on_spotify, 
            published_date: publish_date,
            archived: archived
          })     
end


def list_music_albums
   
end