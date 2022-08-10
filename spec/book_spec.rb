require_relative'../app/book.rb'

describe Book do
  before(:all) do
    @book = Book.new('publisher1','bad',13/11/2021)
  end
  it 'the constructor starts correctly' do
    expect(@book.publisher).to eq 'publisher1'
    expect(@book.cover_state).to eq 'bad'
    expect(@book.publish_date).to eq 13/11/2021
    end
  it 'can_be_archived?' do
    expect(@book.can_be_archived?).to be true
    @book.cover_state = 'good'
    expect(@book.can_be_archived?).to be false
  end
end