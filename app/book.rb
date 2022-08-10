require_relative './item'

class Book < Item
  attr_accessor :publisher, :cover_state

  # rubocop:disable Metrics/ParameterLists
  def initialize(publisher, cover_state, publish_date, author = nil, label = nil, genre = nil, source = nil)
    super(publish_date, author, label, genre, source)
    @publisher = publisher
    @cover_state = cover_state
  end

  # rubocop:enable Metrics/ParameterLists
  def can_be_archived?
    return true if super() || @cover_state == 'bad'

    false
  end
end
