# Lunch Lady Land
require 'pry'
require 'babbler'
@babble = Babbler.babble

class Food
  attr_accessor :name, :cost
  def initialize(name, cost)
    @name = name
    @cost = cost
  end
end

def total
  total = @main_dish.cost.to_f + @side_dish.cost.to_f
end

def anything_else
  puts
  puts "Anything else?"
  print "> "
  input_3 = gets.strip
  if input_3 == 'yes'
    side_menu
  elsif input_3 == 'no'
    puts "Total: $#{total}"
    exit
  end
end

def main_menu
  puts
  puts '-- Lunch Menu --'
  puts 'Please choose a main dish:'
  puts '1: Hot Ham Water ($3)'
  puts '2: Cold soup ($4)'
  puts "3: #{@babble} ($5)"
  print "> "
  input_1
end

def side_menu
  puts
  puts "Please choose a side:"
  puts "1: Peas ($1)"
  puts "2: Yellowish stuff ($1.50)"
  puts "3: Surprise me ($2)"
  print "> "
  input_2
end

def input_1
input_1 = gets.strip
  if input_1 == '1'
    @main_dish = Food.new('Hot Ham Water', 3)
    puts "mmm...#{@main_dish.name}($#{@main_dish.cost})"
  elsif input_1 == '2'
    @main_dish = Food.new('cold_soup', 4)
    puts "Right...#{@main_dish.name}($#{@main_dish.cost})"
  elsif input_1 == '3'
    @main_dish = Food.new("#{@babble}", 5)
    puts "Hmm. #{@main_dish.name}, okay! ($#{@main_dish.cost})"
  elsif input_1 == 'exit'
    exit
  else
    puts "Please Select a valid option!"
    exit
  end
  side_menu
end

def input_2
  input_2 = gets.strip
  if input_2 == '1'
    @side_dish = Food.new('Peas', 1)
    puts "#{@side_dish.name}, you sure? Okay...($#{@side_dish.cost})"
  elsif input_2 == '2'
    @side_dish = Food.new('Yellowish Stuff', 1.5)
    puts "Great choice. I love the #{@side_dish.name} ($#{@side_dish.cost})"
  elsif input_2 == '3'
    @side_dish = Food.new('Surprise me', 2)
    puts "#{@side_dish.name}? Let me check the back ($#{@side_dish.cost})"
  elsif input_2 == 'exit'
    exit
  else
    puts "Please Select a valid option!"
    exit
  end
  anything_else
end

main_menu
