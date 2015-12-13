gem 'minitest', '~> 5.2'                          # => true
require 'minitest/autorun'                        # => true
require 'minitest/pride'                          # => true
require_relative '../lib/key_generating_machine'  # => true
require_relative '../lib/runner'                  # => true

class EnigmaTest < Minitest::Test  # => Minitest::Test


#Random 5 digit key is generated
  def test_key_generator_is_random
    # skip
    keyarray_1 = KeyGeneratingMachine.new         # => #<KeyGeneratingMachine:0x007fa59983d060>
    keyarray_2 = KeyGeneratingMachine.new         # => #<KeyGeneratingMachine:0x007fa59983cc78>
    assert_equal false, keyarray_1 == keyarray_2  # => true
     #Test= Encrypt.new("55744")
  end                                             # => :test_key_generator_is_random

#original five digit number is converted to ABCD format
  def test_converts_five_digit_key_to_ABCD_format
    skip
    key_array = KeyGeneratingMachine.new
    Runner.key_to_abcd(key_array)
    assert_equal 2, @a_1.length
  end                                              # => :test_converts_five_digit_key_to_ABCD_format

#Calculates date by number
  def test_date_is_converted_to_number_form
    # skip
    date = Runner.new(["0", "1", "2", "3", "4"])                                                # => #<Runner:0x007fa59984e810>
    assert_equal false, date.date_to_number_format.include?(".")  # => true
  end                                                             # => :test_date_is_converted_to_number_form

#Date is squared
  def test_date_is_squared
    # skip
    date = Runner.new(["0", "1", "2", "3", "4"])                                       # => 123085
    assert_equal "15149917225", date.square_date("123085")
  end                                                   # => :test_date_is_squared

#Last four digits of squared number become ABCD
  def test_that_ABCD_is_squared_numbers_last_four_digits
    #how does it recognize the class?
    skip
    new_square = 15149917225
    assert_equal 7225, new_square.square_to_offset
  end                                                     # => :test_that_ABCD_is_squared_numbers_last_four_digits


#two ABCD numbers are added together
  def test_add_two_ABCD_numbers_together
    skip
    final_a = Runner.new(["0", "1", "2", "3", "4"])   
    assert_equal 52, final_a.add_abcds
  end                                     # => :test_add_two_ABCD_numbers_together

  #A letter is properly organized into its number equivalent
  def test_properly_organizes_a_character_into_numbers
    message = Runner.new(["0", "1", "2", "3", "4"])                                   # => #<Runner:0x007fa599855ca0>
    assert_equal "0 ", message.encrypt("a")             # => true
  end                                                   # => :test_properly_organizes_a_character_into_numbers

  #A message is properly organized into its number equivalent
  def test_properly_organizes_a_message_into_numbers
    skip
    message = Runner.new("an apple")
    assert_equal "0 13 36 0 15 15 11 4 ", message.encrypt("an apple")
  end                                                                  # => :test_properly_organizes_a_message_into_numbers

#message in character form is organized in ABCD format
  def test_organizes_character_message_in_ABCD_format
    skip
    numbered_message = ["7", "14", "17", "0", "2", "4"]
    assert_equal ["57", "31", "71", "26", "52", "21"], numbered_message.rotate
  end                                                                           # => :test_organizes_character_message_in_ABCD_format

#message is converted into encrytped message using remainder of 39 character system
  def test_message_is_encrypted_thru_39_character_system
    skip
    numbered_message = ["57", "31", "71", "26", "52", "21"]
    assert_equal ["s", "7", "0", "n", "r"], numbered_message.reverse_rotate
  end                                                                        # => :test_message_is_encrypted_thru_39_character_system

end  # => :test_message_is_encrypted_thru_39_character_system

# >> 7 14 17 0 2 4
# >> Run options: --seed 14754
# >>
# >> # Running:
# >>
# >> \e[41m\e[37mE\e[0m\e[31m*\e[0m\e[32mS\e[0m\e[33m*\e[0m\e[34mS\e[0m\e[35mS\e[0m\e[36mS\e[0m\e[31m*\e[0m\e[32mS\e[0m\e[33mS\e[0m
# >>
# >> \e[31mF\e[0m\e[32ma\e[0m\e[33mb\e[0m\e[34mu\e[0m\e[35ml\e[0m\e[36mo\e[0m\e[31mu\e[0m\e[32ms\e[0m\e[33m \e[0m\e[34mr\e[0m\e[35mu\e[0m\e[36mn\e[0m in 0.001823s, 5485.4635 runs/s, 1645.6391 assertions/s.
# >>
# >>   1) Error:
# >> EnigmaTest#test_date_is_squared:
# >> NoMethodError: undefined method `square_date' for 123085:Fixnum
# >>     /Users/marinacorona/Turing/Module1/EnigmaProject/test/enigma_test.rb:38:in `test_date_is_squared'
# >>
# >> 10 runs, 3 assertions, 0 failures, 1 errors, 6 skips
# >>
# >> You have skipped tests. Run with --verbose for details.
