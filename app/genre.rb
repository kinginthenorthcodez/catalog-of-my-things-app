require_relative './item'

class Genre
   
    def initialize(name)
        @id = Random.rand(1..1000)
        @name = name
        @item = []
    end

end