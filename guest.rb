class Guest

    attr_reader :name, :cash

    def initialize(name, cash)
        @name = name
        @cash = cash
    end

    def pay(amount)
        @cash -= amount
    end

    def sing(song)
        p "#{@name}: #{song.lyric}".chomp()
    end

    def can_pay?(price)
        return price <= @cash
    end

end
