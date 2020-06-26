require('minitest/autorun')
require('minitest/reporters')

require_relative('../song')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new()

class TestSong < MiniTest::Test


end