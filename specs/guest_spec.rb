require('minitest/autorun')
require('minitest/reporters')

require_relative('../guest')
require_relative('../song')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new()

class TestGuest < MiniTest::Test

    def setup()
        @guest_1 = Guest.new("Ali", 20)
        @guest_2 = Guest.new("Bobby", 30)
        @guest_3 = Guest.new("Charlie", 40)
        @song_1 = Song.new("Blur", "Song 2", "Wooo-hooo!")
    end

    def test_guest_has_name()
        assert_equal("Ali", @guest_1.name)
    end

    def test_guest_has_cash()
        assert_equal(30, @guest_2.cash)
    end

    def test_guest_pay()
        @guest_2.pay(10)
        assert_equal(20, @guest_2.cash)
    end
    
    def test_guest_can_pay_true()
        assert(@guest_1.can_pay?(19.99))
    end

    def test_guest_can_pay_false()
        refute(@guest_1.can_pay?(20.01))
    end

    def test_guest_pay_not_possible_if_can_pay_false()
        # Guest tries to pay for something that they can't afford
        @guest_3.pay(50)
        # Cash not taken so remains same
        assert(40, @guest_3.cash)
    end

    def test_sing()
        assert_output(/Ali: Wooo-hooo!/) { @guest_1.sing(@song_1).chomp() }
    end
end