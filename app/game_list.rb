require_relative './game'
require_relative './author'
require 'json'
require 'fileutils'

module GameList
  def add_game
    puts 'Enter player Name: '
    player = gets.chomp
    puts 'Enter last_played:[Interger] :'
    date = user_input
    puts ' Enter publish date : '
    publish_date = gets.chomp
    print "\n"
    print 'Enter is archived: [Y/N] :'
    archived = parse_bool
    puts 'game created!'
    puts 'Create game Author [Y/N]'
    option = parse_bool
    while option
      game = Game.new(player, date, publish_date, archived)
      add_author(game)
      puts 'Continue..? [Y/N]'
      option = parse_bool
    end
    save_to_file(player, date, publish_date, archived)
  end

  def save_to_file(player, date, publish_date, archived)
    game_object = { multplayer: player, last_played: date, publish_date: publish_date, archived: archived }

    File.write('./app/game.json', JSON.generate([])) unless File.exist?('./app/game.json')
    type_list = JSON.parse(File.read('./app/game.json')).push(game_object)
    File.write('./app/game.json', type_list.to_json)

  end

  def list_games
    File.write('./app/game.json', JSON.generate([])) unless File.exist?('./app/game.json')
    data = JSON.parse(File.read('./app/game.json'))

    puts '| Index | Multplayer | Last Played | Published | Archived |'
    data.each_with_index do |game, index|
      puts "#{[index + 1]} #{game['multplayer']} #{game['last_played']}yrs #{game['publish_date']}} #{game['archived']}"
    end
  end
end
