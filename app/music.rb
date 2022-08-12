require_relative './item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :archived, :publish_date

  def initialize(on_spotify, publish_date, archived)
    super(publish_date, archived)
    @on_spotify = on_spotify
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    return true if super() && @on_spotify == true
    false
  end
end
