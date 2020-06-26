require('minitest/autorun')
require('minitest/reporters')

require_relative('../room')
require_relative('../guest')
require_relative('../song')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new()

class TestRoom < MiniTest::Test

    def setup()
        @room_1 = Room.new("Voodoo", 4, 7.50)
        @room_2 = Room.new("Java", 6, 5)
        @room_3 = Room.new("Africa", 10, 5)
        @guest_1 = Guest.new("Ali", 10)
        @guest_2 = Guest.new("Bobby", 15)
        @guest_3 = Guest.new("Charlie", 20)
        @guest_4 = Guest.new("Dee", 25)
        @guest_5 = Guest.new("Eddie", 30)
        @initial_guests = [@guest_1, @guest_2, @guest_3]
        @song_1 = Song.new("Blur", "Song 2")
        @song_2 = Song.new("U2", "One")
        @songs = [@song_1, @song_2]
    end

    def test_room_has_name()
        assert_equal("Voodoo", @room_1.name)
    end

    def test_room_has_capacity()
        assert_equal(6, @room_2.capacity)
    end

    def test_room_has_price()
        assert_equal(5, @room_3.price)
    end

    def test_admit_guest()
        @initial_guests.each { |guest| @room_1.admit_guest(guest) }
        assert_equal(3, @room_1.guests.count())
        assert(@room_1.guests.include?(@guest_1))
    end

    def test_charge_guest()
        @room_1.charge_guest(@guest_1)
        assert_equal(2.50, @guest_1.cash)
    end

    def test_clear_room()
        @initial_guests.each { |guest| @room_1.admit_guest(guest) }
        @room_1.clear()
        assert_equal(0, @room_1.guests.count)
    end

    def test_playlist_empty()
        assert_equal(0, @room_3.playlist.length)
    end

    def test_add_to_playlist()
        @songs.each { |song| @room_2.add_to_playlist(song) }
        assert_equal(2, @room_2.playlist.length)
        assert(@room_2.playlist.include?(@song_1))
    end

    def test_room_is_full()
        @initial_guests.each { |guest| @room_1.admit_guest(guest) }
        @room_1.admit_guest(@guest_4)
        assert(@room_1.is_full?)
    end

    def test_refuse_entry_if_full()
        # Add first four guests
        @initial_guests.each { |guest| @room_1.admit_guest(guest) }
        @room_1.admit_guest(@guest_4)
        # Add fifth guest (exceeds capacity)
        @room_1.admit_guest(@guest_5)
        # Check fifth guest not added to guests in room
        refute(@room_1.guests.include?(@guest_5))        
    end

end