require_relative './item'

class Game < Item
  attr_accessor :multplayer, :last_played_at
  
  def initialize(multplayer, last_played_at, publish_date, archived)
    super(publish_date, archived)
    @multplayer = multplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?
    return true if super && @last_played_at > 2
    false
  end
end

# item = Item.new(11, true)
# game = Game.new('player 1', 4, 8, true)

# p " item : #{item.move_to_archive}"
# p " game : #{game.move_to_archive}"

# item2 = Item.new(1, true)
# game2 = Game.new('player 1', 3, 12, false)

# p " item2 : #{item2.move_to_archive}"
# p " game2 : #{game2.move_to_archive}"
# # p " item2 archived : #{item2.archived}"
# p " game2 archived : #{game2.archived}"