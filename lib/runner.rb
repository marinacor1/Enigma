require_relative 'key_generating_machine'


class Runner
  attr_accessor :key_array, :date, :a_1, :a_2, :b_1, :b_2, :c_1, :c_2, :d_1, :d_2, :new_date, :rotation_a, :rotation_b, :rotation_c, :rotation_d, :encrypted_array

  def initialize(key_array)
    @key_array = key_array
  end

  def key_to_abcd
    @a_1 =  @key_array[0].to_s + @key_array[1].to_s
    @b_1 =  @key_array[1].to_s + @key_array[2].to_s
    @c_1 =  @key_array[2].to_s + @key_array[3].to_s
    @d_1 =  @key_array[3].to_s + @key_array[4].to_s
    #iterate through these.start with 4 ???
  end

  def date_to_number_format
    @date = Time.now.strftime("%m%d%y")
  end


  def square_date(date)
    @new_date = (date.to_i ** 2).to_s
  end

  def square_to_offset
    @a_2 = @new_date.to_s[-4]
    @b_2 = @new_date.to_s[-3]
    @c_2 = @new_date.to_s[-2]
    @d_2 = @new_date.to_s[-1]
  end

  def add_abcds
   @rotation_a = @a_1.to_i + @a_2.to_i
   @rotation_b = @b_1.to_i + @b_2.to_i
   @rotation_c = @c_1.to_i + @c_2.to_i
   @rotation_d = @d_1.to_i + @d_2.to_i
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
    #puts @encrypted_array.inspect gives ["0", "15", "15", "11", "4"]
    @new_encrypted_array = []
      while index < @encrypted_array.length
        if index_2 == 3
          index_2 = 0
        else
          index_2 +=1
        end
        @new_encrypted_array << (@encrypted_array[index] += rotation_array[index_2])
        index +=1
        # index_2 == 4 ? index_2 = 0 : index_2 += 1
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
    @encryption = []
    @final_offsets.each do |i|
      encrypted_character = i%39
      @encryption << encrypted_character
    end
  end

  def decrypt
    @encrypted_message = encryption.reverse.gsub(/[abcdefghijklmnopqrstuvwxyz]/, 'a' => '0 ', 'b' => '1 ', 'c' => '2 ', 'd' => '3 ', 'e' => '4 ', 'f' => '5 ', 'g' => '6 ', 'h' => '7 ', 'i' => '8 ', 'j' => '9 ', 'k' => '10 ', 'l' => '11 ', 'm' => '12 ', 'n' => '13 ', 'o' => '14 ', 'p' => '15 ', 'q' => '16 ', 'r' => '17 ', 's' => '18 ', 't' => '19 ', 'u' => '20 ', 'v' => '21 ', 'w' => '22 ', 'x' => '23 ', 'y' => '24 ', 'z' => '25 ', '0' => '26', '1' => '27', '2' => '28', '3' => '29', '4' => '30', '5' => '31', '6' => '32', '7' => '33', '8' => '34', '9' => '35', ' ' => '36', '.' => '37', ',' => '38')
  end
end

# engine = Runner.new
# output = engine.encrypt("horace")
# puts output
