require_relative 'key_generating_machine'
require_relative 'file_reader'
require 'pry'


class Runner <  KeyGeneratingMachine

  def initialize(key_array)
    @key_array = key_array

  end

  def addition_manager(message, date = date_to_number_format)
    key_rotations = self.key_to_abcd
    new_date = self.square_date(date)
    date_rotations = self.square_to_offset(new_date)
    final_abcd = self.add_abcds(key_rotations, date_rotations)
    encryption = self.encrypt(message)
    new_encrypted_array = abcd_assignment(encryption)
    final_offsets =  self.add_abcds_again_rotate(final_abcd, new_encrypted_array)
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
    encryption = message.gsub(/[abcdefghijklmnopqrstuvwxyz]/, 'a' => '0 ', 'b' => '1 ', 'c' => '2 ', 'd' => '3 ', 'e' => '4 ', 'f' => '5 ', 'g' => '6 ', 'h' => '7 ', 'i' => '8 ', 'j' => '9 ', 'k' => '10 ', 'l' => '11 ', 'm' => '12 ', 'n' => '13 ', 'o' => '14 ', 'p' => '15 ', 'q' => '16 ', 'r' => '17 ', 's' => '18 ', 't' => '19 ', 'u' => '20 ', 'v' => '21 ', 'w' => '22 ', 'x' => '23 ', 'y' => '24 ', 'z' => '25 ', '0' => '26', '1' => '27', '2' => '28', '3' => '29', '4' => '30', '5' => '31', '6' => '32', '7' => '33', '8' => '34', '9' => '35', '\s' => '36', '.' => '37', ',' => '38')
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

   def character_map
     {'0' => 'a', '1' => 'b', '2' => 'c', '3' => 'd', '4' => 'e', '5' => 'f', '6' => 'g', '7' => 'h', '8' => 'i', '9' => 'j', '10' => 'k', '11' => 'l', '12' => 'm', '13' => 'n', '14' => 'o', '15' => 'p', '16' => 'q', '17' => 'r', '18' => 's', '19' => 't', '20' => 'u', '21' => 'v', '22' => 'w', '23' => 'x', '24' => 'y', '25' => 'z', '26' => '0', '27' => '1', '28' => '2', '29' => '3', '30' => '4', '31' => '5', '32' => '6', '33' => '7 ', '34' => '8', '35' => '9', '36' => '.', '37' => ' ', '38' => ','}
   end

  def decrypt(message_decrypt, final_abcd)
      message_decrypt = message_decrypt.join
     message_decrypt = message_decrypt.gsub(/[a-z0-9 ,\.]/, 'a' => '0 ', 'b' => '1 ', 'c' => '2 ', 'd' => '3 ', 'e' => '4 ', 'f' => '5 ', 'g' => '6 ', 'h' => '7 ', 'i' => '8 ', 'j' => '9 ', 'k' => '10 ', 'l' => '11 ', 'm' => '12 ', 'n' => '13 ', 'o' => '14 ', 'p' => '15 ', 'q' => '16 ', 'r' => '17 ', 's' => '18 ', 't' => '19 ', 'u' => '20 ', 'v' => '21 ', 'w' => '22 ', 'x' => '23 ', 'y' => '24 ', 'z' => '25 ', '0' => '26', '1' => '27', '2' => '28', '3' => '29 ', '4' => '30 ', '5' => '31 ', '6' => '32 ', '7' => '33 ', '8' => '34 ', '9' => '35 ', ' ' => '36 ', '.' => '37 ', ',' => '38 ')
     message_decrypt = self.abcd_assignment(message_decrypt)
     offsets = []
     message_decrypt.each do |letter|
       temp = if letter.include?("a")
         (letter.delete("a").to_i - final_abcd[0]).to_s
       elsif letter.include?("b")
         (letter.delete("b").to_i - final_abcd[1]).to_s
       elsif letter.include?("c")
         (letter.delete("c").to_i - final_abcd[2]).to_s
       else
         (letter.delete("d").to_i - final_abcd[3]).to_s
       end
       offsets.push(temp)
       end
     offsets
     output = []
     offsets.each do |i|
     output << (i.to_i % 39)
     end
     output = output.map { |x| character_map[x.to_s] }
     output = output.join("")
     output

   end

end
