require_relative './book_methods'
require_relative './author_list'
require_relative './game_list'
require_relative './movie'
require_relative '../file/read_write'
require_relative './source'
require_relative './label_methods'
require_relative './music_album'
require_relative './genre'

class Main
  def initialize(options)
    @options = options
  end

  include AuthorList
  include GameList

  def print_menu
    puts "\n Welcome to Catelogy of my things APP"
    @options.each { |option| puts "#{option[:order]}.#{option[:message]}" }
  end

  def user_input
    gets.chomp.to_i
  end

  def prompt_create_movie
    puts('Enter date of publication (YYYY-MM-DD):')
    publish_date = gets.chomp.to_s
    puts('Is the Movie is silent Y/N:')
    silent = gets.chomp.to_s.downcase == 'y'
    puts('Enter Source Name:')
    source_name = gets.chomp.to_s
    Movie.new(silent, publish_date, false)
    Source.new(source_name)
    ReadWrite.new(Movie).add_file({ silent: silent, publish_date: publish_date, archived: false })
    ReadWrite.new(Source).add_file({ name: source_name, items: [] })
    puts('Movie successfully added')
  end

  def parse_bool
    option = gets.chomp
    case option.to_s.upcase
    when 'Y'
      option = true
    when 'N'
      option = false
    end
    option
  end

  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/CyclomaticComplexity
  def promot_user
    @books = BookApp.new
    @books.read_books
    @labels = LabelApp.new
    @labels.read_labels
    loop do
      print_menu
      input = user_input
      case input
      when 1 then @books.list_all_books
      when 2 then list_all(MusicAlbum)
      when 3 then list_all(Movie)
      when 4 then list_games
      when 5 then list_all(Genre)
      when 6 then @labels.list_all_labels
      when 7 then list_author
      when 8 then @books.create_book
      when 9 then list_all(Source)
      when 10 then create_music_album
      when 11 then prompt_create_movie
      when 12 then @labels.create_label
      when 13 then add_game
      else
        @books.save_books
        @labels.save_labels
        break
      end
      break unless input.positive? && input <= 13
    end
  end
  # rubocop:enable Metrics/MethodLength

  # rubocop:enable Metrics/CyclomaticComplexity
  def list_all(type)
    data = ReadWrite.new(type).read_all_records
    if data.empty?
      puts("No #{type} found. \n")
    else
      puts("List of #{type}: \n")
      format_data(data)
    end
  end

  def format_data(data)
    data.each do |item|
      if item["type"] == "MusicAlbum"
        display_list(item)
      # when data.type == 'Movie'
      elsif item["type"] == "Genre"
        display_genre(item)
        # implement method to display formatted movie list
      end
    end
  end

  def create_movie; end
end

Main.new([
           { order: 1, message: 'List all books' },
           { order: 2, message: 'List all music albums' },
           { order: 3, message: 'List all movies' },
           { order: 4, message: 'List of games' },
           { order: 5, message: "List all genres (e.g 'Comedy', 'Thriller')'" },
           { order: 6, message: "List all labels (e.g. 'Gift', 'New')" },
           { order: 7, message: "List all authors (e.g. 'Stephen King')" },
           { order: 8, message: "List all sources (e.g. 'From a friend', 'Online shop')" },
           { order: 9, message: 'Add a book' },
           { order: 10, message: 'Add a music album' },
           { order: 11, message: 'Add a movie' },
           { order: 12, message: 'Add a game' },
           { order: 13, message: 'Add a label' },
           { order: 'Q', message: 'Exit the app' }
         ]).promot_user
