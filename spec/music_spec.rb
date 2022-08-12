require_relative '../app/music'

describe MusicAlbum do
  before(:all) do
    @music = MusicAlbum.new(true, 12 / 12 / 2022, false )
  end

  it 'Create instance of music class correctly' do
    expect(@music.on_spotify).to eq true
    expect(@music.publish_date).to eq 12 / 12 / 2022
    expect(@music.archived).to eq false
  end

  it 'can_be_archived should return the correct bool' do
     expect(@music.can_be_archived?).to eq false
  end

 
end
