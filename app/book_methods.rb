require_relative './book'
class BookApp
  def initialize
    @books = []
  end

  def create_book
    puts 'Input Publisher'
    publisher = gets.chomp
    puts 'Input cover state'
    cover_state = gets.chomp
    puts 'Input publish date'
    publish_date = gets.chomp
    add_book(publisher, cover_state, publish_date)
  end

  def add_book(publisher, cover_state, publish_date)
    book = Book.new(publisher, cover_state, publish_date)
    @books << book unless @books.include?(book)
  end

  def list_all_books
    puts 'List all books'
    puts 'No books added yet.' if @books == []
    @books.each do |iten|
      puts "book id:#{iten.id}
      the publisher: #{iten.publisher}
      the publish date: #{iten.publish_date}
      the cover state: #{iten.cover_state}"
    end
  end
end
