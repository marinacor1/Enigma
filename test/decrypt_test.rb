gem 'minitest', '~> 5.2'
require_relative 'test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/key_generating_machine'
require_relative '../lib/runner'
require 'simplecov'
require '../lib/decrypt'

SimpleCov.start

class EnigmaTest2 < Minitest::Test

  def test_decrypts_encrypted_message
    # skip
    message = Runner.new(["0", "1", "2", "3", "4"])
    assert_equal "apple", message.decrypt(["i", "3", "b", "l", "m"], [8, 14, 25, 39])
  end

end
