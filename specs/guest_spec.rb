require('minitest/autorun')
require('minitest/reporters')

require_relative('../guest')
require_relative('../song')
require_relative('../room')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new()

class TestGuest < MiniTest::Test

    def setup()
        @song_1 = Song.new("Blur", "Song 2", "Wooo-hooo!")
        @song_2 = Song.new("U2", "One", "Is it getting better?...")
        @song_3 = Song.new("Four Tops", "Reach Out (I'll Be There)", "If you feel like you can't go on...")
        @song_4 = Song.new("Three Tenors", "Nessun Dorma", "Nessun dorma, nessun dorma...")
        @room_1 = Room.new("Voodoo", 4, 7.50)
        @playlist_songs = [@song_1, @song_2, @song_3]
        @guest_1 = Guest.new("Ali", 20, @song_2)
        @guest_2 = Guest.new("Bobby", 30, @song_3)
        @guest_3 = Guest.new("Charlie", 40, @song_4)
    end

    def test_guest_has_name()
        assert_equal("Ali", @guest_1.name)
    end

    def test_guest_has_cash()
        assert_equal(30, @guest_2.cash)
    end

    def test_guest_has_fav_song()
        assert_equal("U2", @guest_1.fav_song.artist)
    end

    def test_guest_can_pay_true()
        assert(@guest_1.can_pay?(19.99))
    end

    def test_guest_can_pay_false()
        refute(@guest_1.can_pay?(20.01))
    end

    def test_guest_pay()
        @guest_2.pay(10)
        assert_equal(20, @guest_2.cash)
    end
    
    def test_guest_pay_not_possible_if_guest_can_pay_false()
        # Guest tries to pay for something that they can't afford
        @guest_3.pay(50)
        # Cash not taken
        assert(40, @guest_3.cash)
    end

    def test_sing()
        assert_output(/Ali: Wooo-hooo!/) { @guest_1.sing(@song_1) }
    end
end