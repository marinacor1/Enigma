#require_relative 'runner'

class KeyGeneratingMachine
  attr_accessor :key_array
  #key rotation,

     #Test= Encrypt.new("55744")
  def random_key
    key1 = rand(0..9)
    key2 = rand(0..9)
    key3 = rand(0..9)
    key4 = rand(0..9)
    key5 = rand(0..9)

    @key_array = []
    @key_array << key1
    @key_array << key2
    @key_array << key3
    @key_array << key4
    @key_array

    #5 times each where you shovel key into key_array
  end
  #[9,0,7,9,5]

end
