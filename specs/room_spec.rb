require('minitest/autorun')
require('minitest/reporters')

require_relative('../room')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new()

class TestRoom < MiniTest::Test


end