class Song

    attr_reader :artist, :title, :lyric

    def initialize(artist, title, lyric)
        @artist = artist
        @title = title
        @lyric = lyric
    end

end