class Song

    attr_reader :artist, :title, :lyric, :duration

    def initialize(artist, title, lyric, duration)
        @artist = artist
        @title = title
        @lyric = lyric
        @duration = duration
    end

end