require_relative 'key_generating_machine'
require_relative 'file_reader'
require 'pry'


class Runner <  KeyGeneratingMachine

  def initialize(key_array)
    @key_array = key_array
  end

  def addition_manager(message, date = date_to_number_format)
    key_rotations = key_to_abcd
    new_date = square_date(date)
    date_rotations = square_to_offset(new_date)
    final_abcd = add_abcds(key_rotations, date_rotations)
    encryption = encrypt(message)
    new_encrypted_array = abcd_assignment(encryption)
    final_offsets =  add_abcds_again_rotate(final_abcd, new_encrypted_array)
    final_letters = numbers_to_letters(final_offsets)
  end

  def date_to_number_format
    date = Time.now.strftime("%m%d%y")
  end

  def square_date(date)
    new_date = (date.to_i ** 2).to_s
  end

  def key_to_abcd
    key_rotations =
    [ @key_array[0].to_s + @key_array[1].to_s,
      @key_array[1].to_s + @key_array[2].to_s,
      @key_array[2].to_s + @key_array[3].to_s,
      @key_array[3].to_s + @key_array[4].to_s,
    ]
  end

  def square_to_offset(new_date)
  date_rotations =
    [ new_date.to_s[-4],
      new_date.to_s[-3],
      new_date.to_s[-2],
      new_date.to_s[-1],
    ]
  end

  def add_abcds(key_rotations, date_rotations)

    rotation_a = key_rotations[0].to_i + date_rotations[0].to_i
    rotation_b = key_rotations[1].to_i + date_rotations[1].to_i
    rotation_c = key_rotations[2].to_i + date_rotations[2].to_i
    rotation_d = key_rotations[3].to_i + date_rotations[3].to_i
    final_abcd = [rotation_a, rotation_b, rotation_c, rotation_d]
    final_abcd
  end

  def encrypt(message)
    message.split(//)
    encryption = message.gsub(/[a-z0-9 .,\.]/, 'a' => '0 ', 'b' => '1 ', 'c' => '2 ', 'd' => '3 ', 'e' => '4 ', 'f' => '5 ', 'g' => '6 ', 'h' => '7 ', 'i' => '8 ', 'j' => '9 ', 'k' => '10 ', 'l' => '11 ', 'm' => '12 ', 'n' => '13 ', 'o' => '14 ', 'p' => '15 ', 'q' => '16 ', 'r' => '17 ', 's' => '18 ', 't' => '19 ', 'u' => '20 ', 'v' => '21 ', 'w' => '22 ', 'x' => '23 ', 'y' => '24 ', 'z' => '25 ', '0' => '26', '1' => '27', '2' => '28', '3' => '29', '4' => '30', '5' => '31', '6' => '32', '7' => '33', '8' => '34', '9' => '35', '\s' => '36', '.' => '37', ',' => '38')
    encryption = encryption.chop
  end

  def abcd_assignment(encryption)
    index = 0
    index_2 = -1
   rotation_array =["a", "b", "c", "d"]
    encrypted_array = encryption.split(" ")
    new_encrypted_array = []
      while index < encrypted_array.length
        if index_2 == 3
          index_2 = 0
        else
          index_2 +=1
        end
        new_encrypted_array << (encrypted_array[index] += rotation_array[index_2])
        index +=1
      end
      new_encrypted_array
  end

  def add_abcds_again_rotate(final_abcd, new_encrypted_array)
    final_offsets = []
    new_encrypted_array.each do |letter|
      if letter.include?("a")
        temp = (letter.delete("a").to_i + final_abcd[0]).to_s
      elsif letter.include?("b")
        temp = (letter.delete("b").to_i + final_abcd[1]).to_s
      elsif letter.include?("c")
        temp = (letter.delete("c").to_i + final_abcd[2]).to_s
      else
        temp = (letter.delete("d").to_i + final_abcd[3]).to_s
      end
      final_offsets.push(temp)
    end
    final_offsets
  end


  def numbers_to_letters(final_offsets)
    final_letters = []
    final_offsets.each do |i|
    final_letters <<  (i.to_i % 39)
    end
     characters = [*"a".."z",*"0".."9"," ",".",","]
     output = final_letters.map do |num|
       characters[num]
     end
     output
   end





end
