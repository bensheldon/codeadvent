require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'pry'
end

lines = File.read('day_2.txt').strip.split("\n")

lines.count do |line|
  _string, min, max, letter, password = line.match(/(\d*)-(\d*) ([a-z]): (.*)/).to_a

  count = password.count(letter)
  count >= min.to_i && count <= max.to_i
end


lines.count do |line|
  _string, first, second, letter, password = line.match(/(\d*)-(\d*) ([a-z]): (.*)/).to_a

  matches_first = password[first.to_i - 1] == letter
  matches_second = password[second.to_i - 1] == letter

  (matches_first || matches_second) && !(matches_first && matches_second)
end

binding.pry
