# Lunch Lady Land
require 'pry'
require 'babbler'

class Food
  attr_accessor :name, :cost
  def initialize(name, cost)
    @name = name
    @cost = cost
  end
end

class MainDish < Food
  def initialize(name, cost)
    super(name, cost)
  end
end

class SideDish < Food
  def initialize(name, cost)
    super(name, cost)
  end
end


@babble = Babbler.babble

def main_menu
  puts
  puts '-- Lunch Menu --'
  puts 'Please choose a main dish:'
  puts '1: Hot Ham Water'
  puts '2: Cold soup'
  puts "3: #{@babble}"
  print "> "
end

def side_menu
  puts
  puts "Please choose a side:"
  puts "1: Peas"
  puts "2: Yellowish stuff"
  puts "3: Surprise me"
end

def input_2
  while(true)
    side_menu
    @input_2 = gets.strip
    if @input_2 == '1'
      side_dish = SideDish.new('Peas', 1)
      puts "#{side_dish.name}, you sure? Okay...($#{side_dish.cost})"
    elsif @input_2 == '2'
      side_dish = SideDish.new('Yellowish Stuff', 1.5)
      puts "Great choice. I love the #{side_dish.name} ($#{side_dish.cost})"
    elsif @input_2 == '3'
      side_dish = SideDish.new('Surprise me', 2)
      puts "#{side_dish.name}? Let me check the back ($#{side_dish.cost})"
    elsif @input_2 == 'exit'
      exit
    else
      puts "Please Select a valid option!"
      exit
    end
  end
end

def input
@input_1 = gets.strip
total = @cost
puts total
  if @input_1 == '1'
    main_dish = MainDish.new('Hot Ham Water', 3)
    puts "mmm...#{main_dish.name}($#{main_dish.cost})"
  elsif @input_1 == '2'
    main_dish = MainDish.new('cold_soup', 4)
    puts "Right...#{main_dish.name}($#{main_dish.cost})"
  elsif @input_1 == '3'
    main_dish = MainDish.new("#{@babble}", 5)
    puts "Hmm. #{main_dish.name}, okay! ($#{main_dish.cost})"
  elsif @input_1 == 'exit'
    exit
  else
    puts "Please Select a valid option!"
    exit
  end
  side_menu
  input_2
end

# total = main_dish.cost + side_dish.cost
# total = @cost_1 + @cost_2



main_menu
input


#puts total
