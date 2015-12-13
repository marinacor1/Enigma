require_relative 'key_generating_machine'

class Runner
  attr_accessor :key_array, :date
#get offsets
#adds stuff
#gets four numbers
  def initialize(key_array)
    @key_array
    @date
  end

  def key_to_abcd(key_array)
    @a_1 =  @key_array[0].to_s + @key_array[1].to_s
    @b_2 =  @key_array[1].to_s + @key_array[2].to_s
    @c_3 =  @key_array[2].to_s + @key_array[3].to_s
    @d_4 =  @key_array[3].to_s + @key_array[4].to_s

  end

  def date_to_number_format
    #look at pragmatic studio
    t = Time.now
    date = t.strftime("%m%d%y")
  end

  def square_date(new_date)
    new_date = date.to_i ** 2
  end

  def square_to_offset
    #Fixednum this wont' work. could turn it into an array
    #or find other method for fixed num
    d_2 = new_date[-1]
    c_2 = new_date[-2]
    b_2 = new_date[-3]
    a_2 = new_date[-4]
#this wont' work
  end

  def add_abcds
   @final_a = @a_1 + @a_2
   @final_b = @b_1 + @b_2
   @final_c = @c_1 + @c_2
   @final_d = @d_1 + @d_2
  end

  def encrypt(message)
    # alphabet = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', ' ', '.', ',']  # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
    # number_equivalence = alphabet.each do |i|
    # alphabet.index(i)
    # end
    message.split(//)
    @key_array = message.gsub(/[abcdefghijklmnopqrstuvwxyz]/, 'a' => '0 ', 'b' => '1 ', 'c' => '2 ', 'd' => '3 ', 'e' => '4 ', 'f' => '5 ', 'g' => '6 ', 'h' => '7 ', 'i' => '8 ', 'j' => '9 ', 'k' => '10 ', 'l' => '11 ', 'm' => '12 ', 'n' => '13 ', 'o' => '14 ', 'p' => '15 ', 'q' => '16 ', 'r' => '17 ', 's' => '18 ', 't' => '19 ', 'u' => '20 ', 'v' => '21 ', 'w' => '22 ', 'x' => '23 ', 'y' => '24 ', 'z' => '25 ', '0' => '26', '1' => '27', '2' => '28', '3' => '29', '4' => '30', '5' => '31', '6' => '32', '7' => '33', '8' => '34', '9' => '35', ' ' => '36', '.' => '37', ',' => '38')
  end

  def rotate

  end

  def reverse_rotate

  end
end

# engine = Runner.new
# output = engine.encrypt("horace")
# puts output
