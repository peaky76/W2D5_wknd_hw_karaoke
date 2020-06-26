require('minitest/autorun')
require('minitest/reporters')

require_relative('../room')
require_relative('../guest')

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
    end

    def test_room_has_name()
        assert_equal("Voodoo", @room_1.name)
    end

    def test_admit_guests()
        @guests.each { |guest| @room_1.admit_guest(guest) }
        assert_equal(3, @room_1.guests.count())
        assert(@room_1.guests.include?(@guest_1))
    end

    # def test_admit_guests()
    #     @guests.each { |guest| @room_1.admit_guest(guest) }
    #     assert_equal(3, @room_1.guests.count())
    # end

end