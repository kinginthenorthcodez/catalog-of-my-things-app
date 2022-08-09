class Item
 attr_reader :source, :lable, :genre, :author
 
  def initialize(publish_date, archived)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def source=(source)
    @source = source
  end

  def lable=(lable)
    @lable = lable
  end

  def genre=(genre)
    @genre = genre
  end

  def author=(author)
    @author = author
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    return true if @publish_date > 10
    false
  end
end
