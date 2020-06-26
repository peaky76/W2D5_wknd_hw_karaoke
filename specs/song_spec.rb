require('minitest/autorun')
require('minitest/reporters')

require_relative('../song')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new()

class TestSong < MiniTest::Test

    def setup()
        @song_1 = Song.new("Blur", "Song 2", "Wooo-hooo!", 2)
        @song_2 = Song.new("U2", "One", "Is it getting better?...", 4)
    end

    def test_has_artist()
        assert_equal("Blur", @song_1.artist)
    end

    def test_has_title()
        assert_equal("One", @song_2.title)
    end

    def test_has_lyric()
        assert_equal("Wooo-hooo!", @song_1.lyric)
    end

    def test_has_duration()
        assert_equal(2, @song_1.duration)
    end

end