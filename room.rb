class Room

    attr_reader :name, :guests, :playlist

    def initialize(name, capacity)
        @name = name
        @capacity = capacity
        @guests = []
        @playlist = []
    end

    def admit_guest(guest)
        @guests << guest
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
