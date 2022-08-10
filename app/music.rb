class MusicAlbum

   attr_accessor :on_spotify

   def initialize(on_spotify)
    @on_spotify = on_spotify
   end

   def can_be_archived?
      true if super() && @on_spotify = true
      false
   end
end
