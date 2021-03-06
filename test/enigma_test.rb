gem 'minitest', '~> 5.2'
require_relative 'test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/key_generating_machine'
require_relative '../lib/runner'
require 'simplecov'
require '../lib/encrypt'
require '../lib/decrypt'
SimpleCov.start

class EnigmaTest < Minitest::Test


#Random 5 digit key is generated
  def test_key_generator_is_random
    # skip
    keyarray_1 = KeyGeneratingMachine.new
    keyarray_2 = KeyGeneratingMachine.new
    assert_equal false, keyarray_1 == keyarray_2
  end

#original five digit number is converted to ABCD format
  def test_converts_five_digit_key_to_A_format
    runner = Runner.new(["0", "1", "2", "3", "4"])
    key_rotations = runner.key_to_abcd
    a_1 = key_rotations[0]
    assert_equal "01", a_1
  end

  def test_converts_five_digit_key_to_b_format
    runner = Runner.new(["0", "1", "2", "3", "4"])
    key_rotations = runner.key_to_abcd
    b_1 = key_rotations[1]
    assert_equal "12", b_1
  end

  def test_converts_five_digit_key_to_c_format
    runner = Runner.new(["0", "1", "2", "3", "4"])
    key_rotations = runner.key_to_abcd
    c_1 = key_rotations[2]
    assert_equal "23", c_1
  end

  def test_converts_five_digit_key_to_d_format
    runner = Runner.new(["0", "1", "2", "3", "4"])
    key_rotations = runner.key_to_abcd
    d_1 = key_rotations[3]
    assert_equal "34", d_1
  end
#Calculates date by number
  def test_date_is_converted_to_number_form
    #skip
    runner = Runner.new(["0", "1", "2", "3", "4"])
    refute_equal Time, runner.date_to_number_format.class
  end

  def test_date_is_four_digits_long
    #skip
    runner = Runner.new(["0", "1", "2", "3", "4"])
    refute_equal 4, runner.date_to_number_format.length
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
    new_date = runner.square_date("123085")
    offsets = runner.square_to_offset(new_date)
    assert_equal "7", offsets[0]
    assert_equal "2", offsets[1]
    assert_equal "2", offsets[2]
    assert_equal "5", offsets[3]
  end

  def test_add_two_A_numbers_together
    final_a = Runner.new(["0", "1", "2", "3", "4"])
    key_rotations = final_a.key_to_abcd
    new_date = final_a.square_date("123085")
    date_rotations = final_a.square_to_offset(new_date)
    final_abcd = final_a.add_abcds(key_rotations, date_rotations)
    assert_equal 8, final_abcd[0]
  end

  def test_add_two_B_numbers_together
    final_a = Runner.new(["0", "1", "2", "3", "4"])
    key_rotations = final_a.key_to_abcd
    new_date = final_a.square_date("123085")
    date_rotations = final_a.square_to_offset(new_date)
    final_abcd = final_a.add_abcds(key_rotations, date_rotations)
    assert_equal 14, final_abcd[1]
  end

  def test_add_two_C_numbers_together
    final_a = Runner.new(["0", "1", "2", "3", "4"])
    key_rotations = final_a.key_to_abcd
    new_date = final_a.square_date("123085")
    date_rotations = final_a.square_to_offset(new_date)
    final_abcd = final_a.add_abcds(key_rotations, date_rotations)
    assert_equal 25, final_abcd[2]
  end

  def test_add_two_D_numbers_together
    final_a = Runner.new(["0", "1", "2", "3", "4"])
    key_rotations = final_a.key_to_abcd
    new_date = final_a.square_date("123085")
    date_rotations = final_a.square_to_offset(new_date)
    final_abcd = final_a.add_abcds(key_rotations, date_rotations)
    assert_equal 39, final_abcd[3]
  end

  def test_properly_organizes_a_letter_into_numbers
    # skip
    message = Runner.new(["0", "1", "2", "3", "4"])
    assert_equal "0", message.encrypt("a")
  end

  def test_properly_organizes_a_message_into_numbers
    # skip
    message = Runner.new(["0", "1", "2", "3", "4"])
    assert_equal "0 13 0 15 15 11 4 8 18 6 17 4 0 19", message.encrypt("an apple is great")
  end

  #A message is properly organized into its number equivalent
  def test_properly_organizes_a_word_into_numbers
    # skip
    message = Runner.new(["0", "1", "2", "3", "4"])
    assert_equal "0 15 15 11 4", message.encrypt("apple")
  end

#message in character form is organized in ABCD format
  def test_organizes_character_message_in_ABCD_format
    # skip
    message = Runner.new(["0", "1", "2", "3", "4"])
    assert_equal ["0a", "15b", "15c", "11d", "4a"], message.abcd_assignment(message.encrypt("apple"))
  end


  def test_characters_have_abcd_deleted_and_rotates
    message = Runner.new(["0", "1", "2", "3", "4"])
    message.abcd_assignment(message.encrypt("apple"))
    key_rotations = message.key_to_abcd
    date_rotations =message.square_to_offset("123085")
    final_abcd = message.add_abcds(key_rotations, date_rotations)
    new_encrypted_array = message.abcd_assignment(message.encrypt("apple"))
    assert_equal ["4", "27", "46", "50", "8"], message.add_abcds_again_rotate(final_abcd, new_encrypted_array)
  end


  def test_addition_manager_organizes_all_methods
    # skip
    message = Runner.new(["0", "1", "2", "3", "4"])
    message.addition_manager("123085")
    assert_equal ["i", "3", "b", "l", "m"], message.numbers_to_letters(["8", "29", "40", "50", "12"])
  end


end
