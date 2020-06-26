require('minitest/autorun')
require('minitest/reporters')

require_relative(‘../guest’)

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new()

class TestGuest < MiniTest::Test


end