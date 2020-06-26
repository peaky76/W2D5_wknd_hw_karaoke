class Room

    attr_reader :name, :guests

    def initialize(name)
        @name = name
        @guests = []
    end

    def admit_guest(guest)
        @guests << guest
    end

    def clear()
        @guests.clear()
    end
end
