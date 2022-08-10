require 'fileutils'
require 'json'
require_relative'./book.rb'

def read_books(app)
  File.write('books.json', JSON.generate([])) unless File.exist?('books.json')

  books = JSON.parse(File.read('books.json'))
  books.each do |book|
    book = Book.new(book['title'], book['author'])
    app.books.push(book)
  end
end