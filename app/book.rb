require_relative './item'

class Book < Item
  def initialize(publisher, cover_state, publish_date, id)
    super(publish_date, id)
    @publisher = publisher
    @cover_state = cover_state
    @publish_date = publish_date
    @id = id
  end

  def can_be_archived?()
    true if can_be_archived || @cover_state == 'bad'
    false
  end
end
