# Lunch Lady Land
require 'pry'

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
    @calories = {'Hot Ham Water' => 40, 'Cold Soup' => 50, 'Surprise Me' => 400, 'Peas' => 20, 'Yellowish Stuff' => 650, 'Tuna Salad' => 2}
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
  puts "3: Tuna Salad ($5.87)"
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
    @dish = Dish.new('Hot Ham Water', 3.45)
    puts "mmm...#{@dish.name}($#{@dish.cost})"
  elsif input_1 == '2'
    @dish = Dish.new('Cold Soup', 4.32)
    puts "Right...#{@dish.name}($#{@dish.cost})"
  elsif input_1 == '3'
    @dish = Dish.new('Tuna Salad', 5.87)
    puts "Hmm. #{@dish.name}, okay! ($#{@dish.cost})"
  elsif input_1 == 'clear'
    clear
  elsif input_1 == 'exit'
    exit
  else
    puts "Please Select a valid option!"
    clear
  end
  order_checks
  side_menu
end

def input_2
  input_2 = gets.strip
  if input_2 == '1'
    @dish = Dish.new('Peas', 0.99)
    puts "#{@dish.name}, you sure? Okay...($#{@dish.cost})"
  elsif input_2 == '2'
    @dish = Dish.new('Yellowish Stuff', 1.5)
    puts "Great choice. I love the #{@dish.name} ($#{@dish.cost})"
  elsif input_2 == '3'
    @dish = Dish.new('Surprise Me', 2.12)
    puts "#{@dish.name}? Let me check the back ($#{@dish.cost})"
  elsif input_2 == 'clear'
    clear
  elsif input_2 == 'exit'
    exit
  else
    puts "Please Select a valid option!"
    clear
  end
  order_checks
  anything_else
end

def anything_else
  puts
  puts "Anything else? (Y/N)"
  print "> "
  @input_anything = gets.strip
  if ['y', 'yes'].include?(@input_anything)
    check_wallet
  elsif ['n', 'no'].include?(@input_anything)
    check_wallet
    exit
  elsif @input_anything == 'clear'
    clear
  else
    puts "Enter a valid option!"
    clear
  end
end

def remove_item
  puts "Remove last item? (Y/N)"
  @input_remove = gets.strip
  if ['y', 'yes'].include?(@input_remove)
    @total_arr.pop
    puts_total
  elsif ['no', 'n'].include?(@input_remove)
    puts "Go get more money."
    clear
  else
    puts "Y/N..."
    clear
  end
end

@name_to_order = []
def add_name_to_order
  @name_to_order << @dish.name
end

def repeat_your_order
  @name_to_order.each do |list_names|
    print "#{list_names}. "
  end
end

def wallet
  @wallet = 10.0
end

def check_total
  @check_total = @total_arr.inject(0){|sum,x| sum + x }
  @check_total.round(2)
end

def puts_total
  repeat_your_order
  puts
  @puts_total = puts "Total: $#{check_total}, Change: $#{change}"
  dish_calories
end

def change
  @change = wallet - check_total
  @change.round(2)
end

@total_arr = []

def add_to_total
  @total_arr << @dish.cost.to_f
end

@puts_calories = []
def dish_calories
  @puts_calories << @dish.calories[@dish.name]
  puts_calories = @puts_calories.inject(0){|sum,x| sum + x }
  puts "Calories: #{puts_calories}"
end

def clear
  system("ruby ~/Documents/DPL/week01/day5/lunch_lady/lunch.rb")
end

def check_wallet
  if check_total > wallet
    puts "Not enough funds."
    remove_item
  elsif check_total < wallet
    if ['yes', 'y'].include?(@input_anything)
      side_menu
    else
      ['no', 'n'].include?(@input_anything)
      puts_total
    end
  end
end

def order_checks
  add_name_to_order
  dish_calories
  add_to_total
end

main_menu
