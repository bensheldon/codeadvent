require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'pry'
  gem 'activesupport'
end

fields = {
  "byr" => proc { |v| v.to_i >= 1920 && v.to_i <= 2002 },
  "iyr" => proc { |v| v.to_i >= 2010 && v.to_i <= 2020 },
  "eyr" => proc { |v| v.to_i >= 2020 && v.to_i <= 2030 },
  "hgt" => (proc do |v|
    height, units = v.match(/^(\d*)(in|cm)$/)&.captures
    if units == "in"
      height.to_i >= 59 && height.to_i <= 76
    elsif units == 'cm'
      height.to_i >= 150 && height.to_i <= 193
    end
  end),
  "hcl" => proc { |v| v.strip.match?(/^#[0-9a-f]{6}$/) },
  "ecl" => proc { |v| %w[amb blu brn gry grn hzl oth].include? v },
  "pid" => proc { |v| v.match?(/^[0-9]{9}$/) },
}
#   cid optional

lines = File.read('day_04.txt').strip.split("\n\n").map { |l| l.gsub("\n", ' ') }

lines = lines.map do |line|
  pairs = line.split(' ')
  pairs.map { |pair| pair.split(':') }.to_h
end

answer = lines.count do |line|
  next false unless (fields.keys - line.keys).empty?

  line.all? do |field, value|
    next true unless fields.keys.include? field

    result = fields[field].call(value.strip)
    # puts [field, value, result].to_s
    result
  end
end

puts answer
