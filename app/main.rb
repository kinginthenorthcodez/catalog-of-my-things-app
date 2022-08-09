class Main
  def initialize(options)
    @options = options
  end

  def print_menu
    puts "\n Welcome to Catelogy of my things APP"
    @options.each { |option| puts "#{option[:order]}.#{option[:message]}" }
  end

  def user_input
    gets.chomp.to_i
  end

  def promot_create_book
    puts 'Input Publisher'
    publisher = user_input
    puts 'Input cover state'
    cover_state = user_input

    authors = [{
      id: 1,
      first_name: 'Isaac',
      last_name: 'Maqueen',
      items: [1, 2, 3]
    }, {
      id: 2,
      first_name: 'Bassem',
      last_name: 'Shams',
      items: [1, 2, 3]
    }]

    authors.each { |author| puts "#{author[:id]} #{author[:first_name]}  #{author[:last_name]}" }
    puts 'Select Author from the list '
    author_index = user_input

    [publisher, cover_state, author_index]
    # Book.new()
  end

  def promot_user # rubocop:disable Metrics/CyclomaticComplexity
    loop do
      print_menu
      input = user_input
      case input
      when 1 then p 'list all books'
      when 2 then p 'list all movie'
      when 3 then p 'list all games'
      when 4 then p 'List all generes'
      when 5 then p 'List all labels'
      when 6 then p 'List all authors'
      when 7 then p 'List all sources'
      when 8 then promot_create_book
      when 9 then p 'List all sourcesasdf'
      when 10 then p 'List all asdf'
      else
        break
      end
      break unless input.positive? && input < 11
    end
  end
end

Main.new([
           { order: 1, message: 'List all books' },
           { order: 2, message: 'List all movies' },
           { order: 3, message: 'List of games' },
           { order: 4, message: "List all genres (e.g 'Comedy', 'Thriller')'" },
           { order: 5, message: "List all labels (e.g. 'Gift', 'New')" },
           { order: 6, message: "List all authors (e.g. 'Stephen King')" },
           { order: 7, message: "List all sources (e.g. 'From a friend', 'Online shop')" },
           { order: 8, message: 'Add a book' },
           { order: 9, message: 'Add a music album' },
           { order: 10, message: 'Add a movie' },
           { order: 11, message: 'Add a game' },
           { order: 'Q', message: 'Exit the app' }
         ]).promot_user
