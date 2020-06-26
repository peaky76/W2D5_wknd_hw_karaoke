class Guest

    attr_reader :name, :cash, :fav_song

    def initialize(name, cash, fav_song)
        @name = name
        @cash = cash
        @fav_song = fav_song
    end

    def can_pay?(price)
        return price <= @cash
    end

    def pay(amount)
        return if !can_pay?(amount)
        @cash -= amount
    end

    def sing(song)
        p "#{@name}: #{song.lyric}".chomp()
    end


end
