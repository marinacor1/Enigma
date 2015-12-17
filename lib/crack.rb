require_relative 'encrypt'
require 'pry'

class Crack

  def crack_manager(output, date)
    message = output.encrypt(output)
    message = message.abcd_assignment(message)
    difference = 
    # key_rotations = key_to_abcd
    # new_date = square_date(date)
    # date_rotations = square_to_offset(new_date)
    # final_abcd = add_abcds(key_rotations, date_rotations)
    # encryption = encrypt(message)
    # new_encrypted_array = abcd_assignment(encryption)
    # final_offsets =  add_abcds_again_rotate(final_abcd, new_encrypted_array)
    # final_letters = numbers_to_letters(final_offsets)
  end

end

e = Crack.new("0vds", date)
