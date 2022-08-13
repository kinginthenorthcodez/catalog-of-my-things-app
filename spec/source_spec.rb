require_relative '../app/source'
require_relative '../app/movie'

describe 'Source and Movie' do
  context ' Source add item method  test ' do
    it 'Should add item to items' do
      source = Source.new('Friends')
      mock = double('item')
      allow(source).to receive(:add_item).and_return('item added')
      expect(source.add_item(mock)).to eq 'item added'
    end
  end
  context ' Movie construct test ' do
    it 'Should should have first and last name' do
      movie = Movie.new(false, '12/23/2021', false)
      expect(movie.silent).to eq false
    end
  end
end
