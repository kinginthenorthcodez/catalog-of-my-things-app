class Item
  attr_accessor :source, :label, :genre, :author, :publish_date

  @bol = false
  # rubocop:disable Metrics/ParameterLists
  def initialize(publish_date, author = nil, label = nil, genre = nil, source = nil, archived = @bol)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
    @author = author
    @label = label
    @genre = genre
    @source = source
  end

  # rubocop:enable Metrics/ParameterLists
  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    return true if @publish_date > 10

    false
  end
end
