class Room

    attr_reader :name, :capacity, :price, :guests, :playlist

    def initialize(name, capacity, price_per_person_per_hour)
        @name = name
        @capacity = capacity
        @price = price_per_person_per_hour
        @guests = []
        @playlist = []
    end

    def admit_guest(guest)
        @guests << guest if !is_full?
    end

    def charge_guest(guest)
        guest.pay(@price)        
    end

    def clear()
        @guests.clear()
    end

    def add_to_playlist(song)
        @playlist << song
    end

    def is_full?()
        return @guests.count >= @capacity
    end

end
