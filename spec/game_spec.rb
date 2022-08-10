require_relative '../app/game'

describe "Game" do
  context " Game method achieved test " do
    it "Should return true if super && last_played_at > 2" do 
      game = Game.new('player 1', 4, 12, true)
      expect(game.move_to_archive).to be true
    end
  end
  context " Game construct test " do
    it "Should should add player" do 
      game = Game.new('player 1', 4, 12, true)
      expect(game.multplayer).to eq 'player 1'
    end
  end
end