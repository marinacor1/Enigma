require './lib/runner'
require './lib/key_generating_machine'



  message_file           = ARGV[0]
  encrypted_file         = ARGV[1]
  message                = File.read(message_file)
  key                    = KeyGeneratingMachine.new.random_key
  date                   = Time.now.strftime("%d%m%y")
  encrypted_message      = Runner.new(key).addition_manager(message)
  File.write(encrypted_file, encrypted_message)
  puts "Created #{encrypted_file.inspect} with the #{date} and #{key}"
