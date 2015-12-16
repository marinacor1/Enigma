require_relative 'key_generating_machine'
require 'pry'


class Runner
  attr_accessor :key_array, :date, :a_2, :b_2,:c_2, :d_2, :new_date, :rotation_a, :rotation_b, :rotation_c, :rotation_d, :encrypted_array

  def initialize(key_array)
    @key_array = key_array
  end

  def date_to_number_format
    @date = Time.now.strftime("%m%d%y")
  end

  def square_date(date) #have to call this before key to square to offset.
    #create a return and then what i pass into square to offset is the same
    @new_date = (date.to_i ** 2).to_s
  end

  def key_to_abcd
    [ @key_array[0].to_s + @key_array[1].to_s,
      @key_array[1].to_s + @key_array[2].to_s,
      @key_array[2].to_s + @key_array[3].to_s,
      @key_array[3].to_s + @key_array[4].to_s,
    ]
    #iterate through these.start with 4 ???
  end

  def square_to_offset
    [ @new_date.to_s[-4],
      @new_date.to_s[-3],
      @new_date.to_s[-2],
      @new_date.to_s[-1],
    ]
  end

  def add_abcds(as, date_rotations)
    @rotation_a = as[0].to_i + date_rotations[0].to_i
    @rotation_b = as[1].to_i + date_rotations[1].to_i
    @rotation_c = as[2].to_i + date_rotations[2].to_i
    @rotation_d = as[3].to_i + date_rotations[3].to_i

  end

  def addition_manager(date) #everything will go for this.
    #date into addition mgr. today's date. needs to do it explicitly
    key_rotations = self.key_to_abcd
    # self.add_abcds(as, date_rotations)
    self.square_date(date)
    date_rotations = self.square_to_offset
    self.add_abcds(key_rotations, date_rotations)
  end

  def encrypt(message)
    message.split(//)
    @encrypted_message = message.gsub(/[abcdefghijklmnopqrstuvwxyz]/, 'a' => '0 ', 'b' => '1 ', 'c' => '2 ', 'd' => '3 ', 'e' => '4 ', 'f' => '5 ', 'g' => '6 ', 'h' => '7 ', 'i' => '8 ', 'j' => '9 ', 'k' => '10 ', 'l' => '11 ', 'm' => '12 ', 'n' => '13 ', 'o' => '14 ', 'p' => '15 ', 'q' => '16 ', 'r' => '17 ', 's' => '18 ', 't' => '19 ', 'u' => '20 ', 'v' => '21 ', 'w' => '22 ', 'x' => '23 ', 'y' => '24 ', 'z' => '25 ', '0' => '26', '1' => '27', '2' => '28', '3' => '29', '4' => '30', '5' => '31', '6' => '32', '7' => '33', '8' => '34', '9' => '35', '\s' => '36', '.' => '37', ',' => '38')
    @encrypted_message = @encrypted_message.chop
  end #check ruby language about space /s?
#gsub in ruby docs?

  def abcd_assignment(message)

  #puts @encrypted_message gives you "0 15 15 11 4"
    index = 0
    index_2 = -1
   rotation_array =["a", "b", "c", "d"]
    @encrypted_array = @encrypted_message.split(" ")
    @new_encrypted_array = []
      while index < @encrypted_array.length
        if index_2 == 3
          index_2 = 0
        else
          index_2 +=1
        end
        @new_encrypted_array << (@encrypted_array[index] += rotation_array[index_2])
        index +=1
      end
      @new_encrypted_array
  end

  def add_abcds_again_rotate
    @final_offsets = []
    @encrypted_array.each do |letter|
      if letter.include?("a")
        temp = (letter.delete("a").to_i + @rotation_a).to_s
      elsif letter.include?("b")
        temp = (letter.delete("b").to_i + @rotation_b).to_s
      elsif letter.include?("c")
        temp = (letter.delete("c").to_i + @rotation_c).to_s
      else
        temp = (letter.delete("d").to_i + @rotation_d).to_s
      end
      @final_offsets.push(temp)
    end
    @final_offsets
  end


  def numbers_to_letters(final_offsets)
    final_letters = []
    final_offsets.each do |i|
    final_letters <<  i.to_i % 39
    # binding.pry
    end
     characters = [*"a".."z",*"0".."9"," ",".",","]
     final_letters.map do |num|
       characters[num]
     end
   end

  def decrypt(message_decrypt)
     p message_decrypt
     message_decrypt.join
    p message_decrypt
    message_decrypt = message_decrypt.gsub(/[abcdefghijklmnopqrstuvwxyz]/, 'a' => '0 ', 'b' => '1 ', 'c' => '2 ', 'd' => '3 ', 'e' => '4 ', 'f' => '5 ', 'g' => '6 ', 'h' => '7 ', 'i' => '8 ', 'j' => '9 ', 'k' => '10 ', 'l' => '11 ', 'm' => '12 ', 'n' => '13 ', 'o' => '14 ', 'p' => '15 ', 'q' => '16 ', 'r' => '17 ', 's' => '18 ', 't' => '19 ', 'u' => '20 ', 'v' => '21 ', 'w' => '22 ', 'x' => '23 ', 'y' => '24 ', 'z' => '25 ', '0' => '26', '1' => '27', '2' => '28', '3' => '29', '4' => '30', '5' => '31', '6' => '32', '7' => '33', '8' => '34', '9' => '35', '\s' => '36', '.' => '37', ',' => '38')
    #  message_decrypt = message_decrypt.gsub(/[abcdefghijklmnopqrstuvwxyz]/, '0' => 'a', '1 ' => 'b ', '2' => 'c ', '3' => 'd ', '4' => 'e ', '5' => 'f ', '6' => 'g ', '7' => 'h ', '8' => 'i ', '9' => 'j ', '10' => 'k ', '11' => 'l ', '12' => 'm ', '13' => 'n ', '14' => 'o ', '15' => 'p ', '16' => 'q ', '17' => 'r ', '18' => 's ', '19' => 't ', '20' => 'u ', '21' => 'v ', '22' => 'w ', '23' => 'x ', '24' => 'x ', '25' => 'y ', '26' => 'z ', '27' => '1 ', '28' => '2 ', '29' => '3 ', '30' => '4 ', '31' => '5 ', '32' => '6 ', '33' => '7 ', '34' => '8 ', '35' => '9', '36' => '.', '37' => ' ', '38' => ',')
    # p message_decrypt
    self.abcd_assignment(message_decrypt)
    offsets = []
    message_decrypt.each do |letter|
      if letter.include?("a")
        temp = (letter.delete("a").to_i - @rotation_a).to_s
      elsif letter.include?("b")
        temp = (letter.delete("b").to_i - @rotation_b).to_s
      elsif letter.include?("c")
        temp = (letter.delete("c").to_i - @rotation_c).to_s
      else
        temp = (letter.delete("d").to_i - @rotation_d).to_s
      end
      offsets.push(temp)
    end
    offsets
  end
     p message_decrypt
     message_decrypt = message_decrypt.gsub(/[abcdefghijklmnopqrstuvwxyz]/, 'a' => '0 ', 'b' => '1 ', 'c' => '2 ', 'd' => '3 ', 'e' => '4 ', 'f' => '5 ', 'g' => '6 ', 'h' => '7 ', 'i' => '8 ', 'j' => '9 ', 'k' => '10 ', 'l' => '11 ', 'm' => '12 ', 'n' => '13 ', 'o' => '14 ', 'p' => '15 ', 'q' => '16 ', 'r' => '17 ', 's' => '18 ', 't' => '19 ', 'u' => '20 ', 'v' => '21 ', 'w' => '22 ', 'x' => '23 ', 'y' => '24 ', 'z' => '25 ', '0' => '26', '1' => '27', '2' => '28', '3' => '29', '4' => '30', '5' => '31', '6' => '32', '7' => '33', '8' => '34', '9' => '35', '\s' => '36', '.' => '37', ',' => '38')




end

# engine = Runner.new
# output = engine.encrypt("horace")
# puts output
