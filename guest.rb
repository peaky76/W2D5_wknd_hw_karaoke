class Guest

    attr_reader :name, :cash, :fav_song

    def initialize(name, cash, fav_song)
        @name = name
        @cash = cash
        @fav_song = fav_song
    end

    def pay(amount)
        return if !can_pay?(amount)
        @cash -= amount
    end

    def sing(song)
        p "#{@name}: #{song.lyric}".chomp()
    end

    def can_pay?(price)
        return price <= @cash
    end

    def rate_playlist(room)
        if room.playlist_contains?(@fav_song)
            p "Yes! Get in!"
        else
            p "WTF is this shite? I want to sing #{@fav_song.title}!"
        end
    end

end
