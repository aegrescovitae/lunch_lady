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

def main_menu
  puts
  puts ' -- WELCOME --'
  puts '-- LUNCH MENU --'
  puts "-- WALLET: $!0 --"
  puts
  puts 'Please choose a main dish:'
  puts '1: Hot Ham Water ($3.45)'
  puts '2: Cold soup ($4.32)'
  puts "3: #{@babble} ($5.87)"
  print "> "
  input_1
end

def side_menu
  puts
  puts "Please choose a side:"
  puts "1: Peas ($.99)"
  puts "2: Yellowish stuff ($1.50)"
  puts "3: Surprise me ($2.12)"
  print "> "
  input_2
end

def input_1
input_1 = gets.strip
  if input_1 == '1'
    @dish = Food.new('Hot Ham Water', 3.45)
    puts "mmm...#{@dish.name}($#{@dish.cost})"
  elsif input_1 == '2'
    @dish = Food.new('cold_soup', 4.32)
    puts "Right...#{@dish.name}($#{@dish.cost})"
  elsif input_1 == '3'
    @dish = Food.new("#{@babble}", 5.87)
    puts "Hmm. #{@dish.name}, okay! ($#{@dish.cost})"
  elsif input_1 == 'clear'
    clear
  elsif input_1 == 'exit'
    exit
  else
    puts "Please Select a valid option!"
    clear
  end
  total
  side_menu
end

def input_2
  input_2 = gets.strip
  if input_2 == '1'
    @dish = Food.new('Peas', 0.99)
    puts "#{@dish.name}, you sure? Okay...($#{@dish.cost})"
  elsif input_2 == '2'
    @dish = Food.new('Yellowish Stuff', 1.5)
    puts "Great choice. I love the #{@dish.name} ($#{@dish.cost})"
  elsif input_2 == '3'
    @dish = Food.new('Surprise me', 2.12)
    puts "#{@dish.name}? Let me check the back ($#{@dish.cost})"
  elsif input_2 == 'clear'
    clear
  elsif input_2 == 'exit'
    exit
  else
    puts "Please Select a valid option!"
    clear
  end
  total
  anything_else
end

def anything_else
  puts
  puts "Anything else? (Y/N)"
  print "> "
  input_3 = gets.strip
  if ['y', 'yes'].include?(input_3)
    if check_total > wallet
      puts "You don't have enough money."
      puts "Total: $#{check_total}"
      remove_item
    else
      side_menu
    end
  elsif ['n', 'no'].include?(input_3)
    puts "Total: $#{check_total}, Change: $#{change}"
    exit
  elsif input_3 == 'clear'
    clear
  end
end

def remove_item
  puts "Remove last item? (Y/N)"
  input = gets.strip
  if ['y', 'yes'].include?(input)
    @total_arr.pop
    puts "Total: $#{check_total}, Change: $#{change}"
  elsif ['no', 'n'].include?(input)
    puts "Go get more money."
    clear
  else
    puts "Y/N..."
    clear
  end
end

def wallet
  @wallet = 10
end

def check_total
  @check_total = @total_arr.inject(0){|sum,x| sum + x }
end

def change
  @change = @wallet - @check_total
end

@total_arr = []

def total
  @total_arr << @dish.cost.to_f
end

def clear
  system("ruby ~/Documents/DPL/week01/day5/lunch_lady/lunch.rb")
end

main_menu
