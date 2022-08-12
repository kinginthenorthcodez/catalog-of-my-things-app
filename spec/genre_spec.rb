require_relative '../app/genre'
require_relative '../app/music'

describe Genre do
  before(:all) do
    @genre = Genre.new('Eli')
  end

  it 'Check if genre object is created correctly' do
    expect(@genre.name).to eq 'Eli'
  end

  it 'add_item method' do
    @music = MusicAlbum.new(true, 12 / 10 / 2022, false)
    @genre.add_item(@music)
    expect(@genre.items.length).to eq 1
    expect(@music.genre).to eq @genre
  end
end
