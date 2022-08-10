require_relative '../app/label'

describe Label do
  before(:all) do
    @label = Label.new('black', 'new')
  end
  it 'the label constructor starts correctly' do
    expect(@label.title).to eq 'new'
    expect(@label.color).to eq 'black'
  end
  it 'add_item method works fine' do
    @book = Book.new('publisher1', 'bad', 12 / 12 / 2020)
    @label.add_item(@book)
    expect(@label.items.length).to eq 1
    expect(@book.label).to eq @label
  end
end
