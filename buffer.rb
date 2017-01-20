require_relative 'lib/queue'

buffer = Launch::Queue.new
  File.open('apples.txt', 'r') do |file|
  file.each_char do |char|
    buffer.enter(char)
  end
end

count_hash = buffer.char_count

puts count_hash
