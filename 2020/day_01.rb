require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'pry'
end

binding.pry


entries = File.read('day_1_input.txt').split.map(&:to_i)

entries.each do |entry|
  other_entries = entries - [entry]
  other_entries.each do |other_entry|
    puts [entry, other_entry, entry * other_entry].to_s if entry + other_entry == 2020
  end
end

entries.each do |entry|
  second_entries = entries - [entry]

  second_entries.each do |second_entry|
    third_entries = second_entries - [second_entries]

    third_entries.each do |third_entry|
      puts [entry, second_entry, third_entry, entry * second_entry * third_entry].to_s if entry + second_entry + third_entry == 2020
    end
  end
end
