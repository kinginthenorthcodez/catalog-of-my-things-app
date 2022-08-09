require_relative'./item.rb'

class Book < Item
  def initialize(publisher,cover_state)
    @publisher = publisher
    @cover_state = cover_state
  end
  def can_be_archived?()
    true if can_be_archived || @cover_state == 'bad'
    false
  end
  end