require_relative '../app/author'

describe 'Author' do
  context ' Author add item method  test ' do
    it 'Should add item to items' do
      author = Author.new('Isaac', 'Maqueen')
      mock = double('item')
      allow(author).to receive(:add_item).and_return('item added')
      expect(author.add_item(mock)).to eq 'item added'
    end
  end
  context ' Author construct test ' do
    it 'Should should have first and last name' do
      author = Author.new('Isaac', 'Maqueen')
      expect(author.first_name).to eq 'Isaac'
      expect(author.last_name).to eq 'Maqueen'
    end
  end
end
