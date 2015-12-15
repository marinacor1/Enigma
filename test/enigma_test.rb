gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/key_generating_machine'
require_relative '../lib/runner'

class EnigmaTest < Minitest::Test


#Random 5 digit key is generated
  def test_key_generator_is_random
    # skip
    keyarray_1 = KeyGeneratingMachine.new
    keyarray_2 = KeyGeneratingMachine.new
    assert_equal false, keyarray_1 == keyarray_2
     #Test= Encrypt.new("55744")
  end

#original five digit number is converted to ABCD format
  def test_converts_five_digit_key_to_ABCD_format
    # skip
    # key_array = KeyGeneratingMachine.new
    runner = Runner.new(["0", "1", "2", "3", "4"])
    runner.key_to_abcd
    assert_equal "01", runner.a_1
  end

#Calculates date by number
  def test_date_is_converted_to_number_form
    #skip
    runner = Runner.new(["0", "1", "2", "3", "4"])
    refute_equal Time, runner.date_to_number_format.class
  end

#Date is squared
  def test_date_is_squared
    # skip
    runner = Runner.new(["0", "1", "2", "3", "4"])
    assert_equal "15149917225", runner.square_date("123085")
  end

#Last four digits of squared number become ABCD
  def test_that_ABCD_is_squared_numbers_last_four_digits
    # skip
    runner = Runner.new(["0", "1", "2", "3", "4"])
    runner.square_date("123085")
    runner.square_to_offset
    assert_equal "7", runner.a_2
    assert_equal "2", runner.b_2 #don't need to make instance here
  end


#two ABCD numbers are added together
  def test_add_two_ABCD_numbers_together
    final_a = Runner.new(["0", "1", "2", "3", "4"])
    final_a.key_to_abcd
    final_a.square_date("123085")
    final_a.square_to_offset
    final_a.add_abcds
    #assert_equal 8, final_a.rotation_a
    assert_equal 39, final_a.rotation_d
    #in order for rotation_a to happen, all these other methods need to happen
  end

  #A letter is properly organized into its number equivalent
  def test_properly_organizes_a_character_into_numbers
    skip
    message = Runner.new(["0", "1", "2", "3", "4"])
    assert_equal "0 ", message.encrypt("a")
  end

  #A message is properly organized into its number equivalent
  def test_properly_organizes_a_message_into_numbers
    # skip
    message = Runner.new(["0", "1", "2", "3", "4"])
    assert_equal "0 15 15 11 4", message.encrypt("apple")
  end

#message in character form is organized in ABCD format
  def test_organizes_character_message_in_ABCD_format
    skip
    message = Runner.new(["0", "1", "2", "3", "4"])
    message.key_to_abcd
    message.square_date("123085")
    message.square_to_offset
    message.add_abcds
    message.encrypt("apple")
    message.abcd_assignment("apple")
    assert_equal ["57", "31", "71", "26", "52", "21"], message.add_abcds_again_rotate
  end

#message is converted into encrytped message using remainder of 39 character system
  def test_message_is_encrypted_thru_39_character_system
    skip
    numbered_message = ["57", "31", "71", "26", "52", "21"]
    assert_equal ["s", "7", "0", "n", "r"], numbered_message.numbers_to_letters
  end

end
