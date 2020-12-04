require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'pry'
  gem 'activesupport'
end


def toboggan(move_x, move_y)
  lines = File.read('day_03.txt').strip.split("\n")
  trees = 0

  x_position = 0
  y_position = 0
  while true
    x_position += move_x
    y_position += move_y

    line = lines[y_position]
    break unless line

    trees += 1 if line[x_position % line.size] == '#'
  end

  trees
end

[
  [1, 1],
  [3, 1],
  [5, 1],
  [7, 1],
  [1, 2]
].map { |move_x, move_y| toboggan(move_x, move_y) }.inject(&:*)

toboggan(1, 1)]


lines[1..-1].each do |line|
  position += 3
  trees += 1 if line[position % line.size] == '#'
end

puts trees

binding.pry


#
# lines.count do |line|
#   _string, min, max, letter, password = line.match(/(\d*)-(\d*) ([a-z]): (.*)/).to_a
#
#   count = password.count(letter)
#   count >= min.to_i && count <= max.to_i
# end
#
#
# lines.count do |line|
#   _string, first, second, letter, password = line.match(/(\d*)-(\d*) ([a-z]): (.*)/).to_a
#
#   matches_first = password[first.to_i - 1] == letter
#   matches_second = password[second.to_i - 1] == letter
#
#   (matches_first || matches_second) && !(matches_first && matches_second)
# end
