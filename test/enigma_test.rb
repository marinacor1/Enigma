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
    skip
    # key_array = KeyGeneratingMachine.new
    variable = Runner.new(["0", "1", "2", "3", "4"])
    variable.key_to_abcd(["0", "1", "2", "3", "4"])
    assert_equal 2, variable.count
  end

#Calculates date by number
  def test_date_is_converted_to_number_form
    #skip
    date = Runner.new(["0", "1", "2", "3", "4"])
    assert_equal false, date.date_to_number_format.include?(".")
  end

#Date is squared
  def test_date_is_squared
    # skip
    date = 123085
    assert_equal "15149917225", date.square_date("123085")
  end

#Last four digits of squared number become ABCD
  def test_that_ABCD_is_squared_numbers_last_four_digits
    skip
    date = Runner.new(["0", "1", "2", "3", "4"])
    assert_equal 7225, @new_date.square_to_offset(15149917225)
  end


#two ABCD numbers are added together
  def test_add_two_ABCD_numbers_together
    skip
    final_a = Runner.new(["0", "1", "2", "3", "4"])
    assert_equal 52, final_a.add_abcds
  end

  #A letter is properly organized into its number equivalent
  def test_properly_organizes_a_character_into_numbers
    skip
    message = Runner.new(["0", "1", "2", "3", "4"])
    assert_equal "0 ", message.encrypt("a")
  end

  #A message is properly organized into its number equivalent
  def test_properly_organizes_a_message_into_numbers
    skip
    message = Runner.new("an apple")
    assert_equal "0 13 36 0 15 15 11 4 ", message.encrypt("an apple")
  end

#message in character form is organized in ABCD format
  def test_organizes_character_message_in_ABCD_format
    skip
    numbered_message = ["7", "14", "17", "0", "2", "4"]
    assert_equal ["57", "31", "71", "26", "52", "21"], numbered_message.rotate
  end

#message is converted into encrytped message using remainder of 39 character system
  def test_message_is_encrypted_thru_39_character_system
    skip
    numbered_message = ["57", "31", "71", "26", "52", "21"]
    assert_equal ["s", "7", "0", "n", "r"], numbered_message.numbers_to_letters
  end

end
