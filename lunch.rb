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

class Dish < Food
  def initialize(name, cost)
    super(name, cost)
  end

  def calories
    @calories = {'hot_ham_water' => 40, 'cold_soup' => 50, 'surprise_me' => 400, 'peas' => 20, 'yellowish_stuff' => 650, 'babble' => 2}
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
    @dish = Dish.new('hot_ham_water', 3.45)
    puts "mmm...#{@dish.name}($#{@dish.cost})"
  elsif input_1 == '2'
    @dish = Dish.new('cold_soup', 4.32)
    puts "Right...#{@dish.name}($#{@dish.cost})"
  elsif input_1 == '3'
    @dish = Dish.new('babble', 5.87)
    puts "Hmm. #{@babble}, okay! ($#{@dish.cost})"
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
    @dish = Dish.new('peas', 0.99)
    puts "#{@dish.name}, you sure? Okay...($#{@dish.cost})"
  elsif input_2 == '2'
    @dish = Dish.new('yellowish_stuff', 1.5)
    puts "Great choice. I love the #{@dish.name} ($#{@dish.cost})"
  elsif input_2 == '3'
    @dish = Dish.new('surprise_me', 2.12)
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
    puts_total
    check_wallet
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
    puts_total
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
  @check_total.round(2)
end

def puts_total
  @puts_total = puts "Total: $#{check_total}, Change: $#{change}"
  puts_calories
end

def change
  @change = wallet - check_total
end

@total_arr = []

def total
  @total_arr << @dish.cost.to_f
end

# ENDED CODING FOR THE NIGHT WORKING ON @dish.calories.key
@puts_calories = []
def puts_calories
  @puts_calories << @dish.calories.key(@dish.name)
  puts "Calories: #{@puts_calories}"
end

def clear
  system("ruby ~/Documents/DPL/week01/day5/lunch_lady/lunch.rb")
end

def check_wallet
  if check_total > wallet
    puts "You don't have enough money."
    remove_item
  end
end


main_menu
