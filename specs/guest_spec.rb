require('minitest/autorun')
require('minitest/reporters')

require_relative('../guest')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new()

class TestGuest < MiniTest::Test

    def setup()
        @guest_1 = Guest.new("Ali", 20)
        @guest_2 = Guest.new("Bobby", 30)
        @guest_3 = Guest.new("Charlie", 40)
    end

    def test_guest_has_name()
        assert_equal("Ali", @guest_1.name)
    end

    def test_guest_has_cash()
        assert_equal(30, @guest_2.cash)
    end

end