require('minitest/autorun')
require('minitest/reporters')

require_relative('../room')
require_relative('../guest')
require_relative('../song')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new()

class TestRoom < MiniTest::Test

    def setup()
        @room_1 = Room.new("Voodoo")
        @room_2 = Room.new("Java")
        @room_3 = Room.new("Africa")
        @guest_1 = Guest.new("Ali")
        @guest_2 = Guest.new("Bobby")
        @guest_3 = Guest.new("Charlie")
        @guests = [@guest_1, @guest_2, @guest_3]
        @song_1 = Song.new("Blur", "Song 2")
        @song_2 = Song.new("U2", "One")
        @songs = [@song_1, @song_2]
    end

    def test_room_has_name()
        assert_equal("Voodoo", @room_1.name)
    end

    def test_admit_guests()
        @guests.each { |guest| @room_1.admit_guest(guest) }
        assert_equal(3, @room_1.guests.count())
        assert(@room_1.guests.include?(@guest_1))
    end

    def test_clear_room()
        @guests.each { |guest| @room_1.admit_guest(guest) }
        @room_1.clear()
        assert_equal(0, @room_1.guests.count())
    end

    def test_add_to_playlist()
        @songs.each { |song| @room_2.add_to_playlist(song) }
        assert_equal(2, @room_2.playlist.length() )
    end

end