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
        @song_1 = Song.new("Blur", "Song 2", "Wooo-hooo!")
        @song_2 = Song.new("U2", "One", "Is it getting better?...")
        @song_3 = Song.new("Four Tops", "Reach Out (I'll Be There)", "If you feel like you can't go on...")
        @song_4 = Song.new("Three Tenors", "Nessun Dorma", "Nessun dorma, nessun dorma...")
        @playlist_songs = [@song_1, @song_2, @song_3]
        @guest_1 = Guest.new("Ali", 10, @song_1)
        @guest_2 = Guest.new("Bobby", 15, @song_2)
        @guest_3 = Guest.new("Charlie", 20, @song_3)
        @guest_4 = Guest.new("Dee", 25, @song_4)
        @guest_5 = Guest.new("Eddie", 30, nil)
        @initial_guests = [@guest_1, @guest_2, @guest_3]
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

    def test_admit_guest_charges_guest()
        @initial_guests.each { |guest| @room_1.admit_guest(guest) }
        assert_equal(12.50, @guest_3.cash)
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
        @playlist_songs.each { |song| @room_2.add_to_playlist(song) }
        assert_equal(3, @room_2.playlist.length)
        assert(@room_2.playlist.include?(@song_1))
    end

    def test_playlist_contains_song_true()
        @playlist_songs.each { |song| @room_2.add_to_playlist(song) }
        assert(@room_2.playlist_contains?(@song_1))
    end

    def test_playlist_contains_song_false()
        @room_3.add_to_playlist(@song_1)
        refute(@room_3.playlist_contains?(@song_2))
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

    def test_playlist_reaction_good()
        @playlist_songs.each { |song| @room_1.add_to_playlist(song) }
        assert_output(/Yes! Get in! I love One/) { @room_1.get_playlist_reaction(@guest_2) }
    end

    def test_playlist_reaction_bad()
#        @playlist_songs.each { |song| @room_1.add_to_playlist(song) }
        assert_output(/WTF is this shite\? I wanted to sing Nessun Dorma!/) { @room_1.get_playlist_reaction(@guest_4) }
    end

end