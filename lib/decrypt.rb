require_relative 'encrypt'
require 'pry'

class Decrypt

  def decrypt(message_decrypt, final_abcd)
      message_decrypt = message_decrypt.join
     message_decrypt = message_decrypt.gsub(/[a-z0-9 ,\.]/, 'a' => '0 ', 'b' => '1 ', 'c' => '2 ', 'd' => '3 ', 'e' => '4 ', 'f' => '5 ', 'g' => '6 ', 'h' => '7 ', 'i' => '8 ', 'j' => '9 ', 'k' => '10 ', 'l' => '11 ', 'm' => '12 ', 'n' => '13 ', 'o' => '14 ', 'p' => '15 ', 'q' => '16 ', 'r' => '17 ', 's' => '18 ', 't' => '19 ', 'u' => '20 ', 'v' => '21 ', 'w' => '22 ', 'x' => '23 ', 'y' => '24 ', 'z' => '25 ', '0' => '26', '1' => '27', '2' => '28', '3' => '29 ', '4' => '30 ', '5' => '31 ', '6' => '32 ', '7' => '33 ', '8' => '34 ', '9' => '35 ', ' ' => '36 ', '.' => '37 ', ',' => '38 ')
     message_decrypt = abcd_assignment(message_decrypt)
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

  def character_map
    {'0' => 'a', '1' => 'b', '2' => 'c', '3' => 'd', '4' => 'e', '5' => 'f', '6' => 'g', '7' => 'h', '8' => 'i', '9' => 'j', '10' => 'k', '11' => 'l', '12' => 'm', '13' => 'n', '14' => 'o', '15' => 'p', '16' => 'q', '17' => 'r', '18' => 's', '19' => 't', '20' => 'u', '21' => 'v', '22' => 'w', '23' => 'x', '24' => 'y', '25' => 'z', '26' => '0', '27' => '1', '28' => '2', '29' => '3', '30' => '4', '31' => '5', '32' => '6', '33' => '7 ', '34' => '8', '35' => '9', '36' => '.', '37' => ' ', '38' => ','}
  end
 end
