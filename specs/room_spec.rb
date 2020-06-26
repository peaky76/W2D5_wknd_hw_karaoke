require('minitest/autorun')
require('minitest/reporters')

require_relative('../room')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new()

class TestRoom < MiniTest::Test

    def setup()
        @room_1 = Room.new("Voodoo")
        @room_2 = Room.new("Java")
        @room_3 = Room.new("Africa")
    end

    def test_room_has_name()
        assert_equal("Voodoo", @room_1.name)
    end

end