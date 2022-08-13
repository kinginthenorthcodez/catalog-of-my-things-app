require_relative './book'
class BookApp
  def initialize
    @books = []
  end

  def create_book
    puts 'Input Publisher'
    publisher = gets.chomp
    puts 'Input cover state (good/bad)'
    cover_state = gets.chomp
    puts 'Input publish date'
    publish_date = gets.chomp
    puts 'Input the author'
    author = gets.chomp
    add_book(publisher, cover_state, publish_date, author)
  end

  def add_book(publisher, cover_state, publish_date, author)
    book = Book.new(publisher, cover_state, publish_date)
    book.author = author
    @books << book unless @books.include?(book)
  end

  def list_all_books
    puts 'List all books'
    puts 'No books added yet.' if @books == []
    @books.each do |iten|
      puts "book id:#{iten.id}
      the author: #{iten.author}
      the publisher: #{iten.publisher}
      the publish date: #{iten.publish_date}
      the cover state: #{iten.cover_state}"
      puts
    end
  end

  def save_books
    books = []
    @books.each do |item|
      book = { publisher: item.publisher, author: item.author, publish_date: item.publish_date,
               cover_state: item.cover_state }
      books.push(book)
    end
    File.write('books.json', JSON.generate(books))
  end

  def read_books
    File.write('books.json', JSON.generate([])) unless File.exist?('books.json')

    books = JSON.parse(File.read('books.json'))
    books.each do |item|
      add_book(item['publisher'], item['cover_state'], item['publish_date'], item['author'])
    end
  end
end
