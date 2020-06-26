require('minitest/autorun')
require('minitest/reporters')

require_relative('../guest')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new()

class TestGuest < MiniTest::Test

    def setup()
        @guest_1 = Guest.new("Ali")
        @guest_2 = Guest.new("Bobby")
        @guest_3 = Guest.new("Charlie")
    end

    def test_guest_has_name()
        assert_equal("Ali", @guest_1.name)
    end

end