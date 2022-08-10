class Source
  attr_accessors :name
  def initialize(name)
    @id = Random.new(0...1000)
    @items = []
    @name = name
  end

  def add_item(item)
    @items << item
    item.source = self
  end
end
