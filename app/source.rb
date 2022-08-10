class Source
  attr_accessor :name

  def initialize(name)
    @id = Random.rand(0...1000)
    @items = []
    @name = name
  end

  def add_item(item)
    @items << item
    item.source = self
  end
end
