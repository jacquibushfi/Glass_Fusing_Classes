

class CLI

  def run
    puts " "
    puts "          Welcome to the Bullseye Class Listing"
    puts " "
    puts "Upcoming Classes in Glass Fusing, Kilncasting, and Coldworking"
    puts "--------------------------------------------------------------"
    puts " "

    Scraper.scrape_klasses  # initial scrape to retrieve the class list
    menu
    input = gets.strip.downcase

    while input != 'exit'  do
      case
      when input.to_i.between?(1, Klass.all.count)
          klass = Klass.all[input.to_i - 1]
          Scraper.scrape_klass_details(klass) if !klass.description  # second scrape to revtieve the class details if they do not already exist
          display_klass_details(klass)
          input = gets.strip.downcase
        when input == "list"   # display the list again
          menu
          input = gets.strip.downcase
        else
          puts "Please select from the options below"    # not a valid entry of class number, list, or exit
          selector_text
          input = gets.strip.downcase
        end
    end
      puts " "
      puts " "
      puts " "
      puts "Thank You for visiting and may you always have happy kiln surprises!!"   # entered exit
  end

  def menu
    Klass.all.each.with_index(1) do |klass, index|  # list selection of classes from the initial scrape
      puts "#{index}. #{klass.title}"
    end
    selector_text
  end

  def selector_text
    puts " "
    puts "Please enter a class number to see the class details (1 - #{Klass.all.count} ),  'list' to see the list again, or  'exit' to exit"
    puts "---------------------------------------------------------------------------------------------------------------------------------"
  end

  def display_klass_details(klass)
    puts " "
    puts "#{klass.title}"
    puts " "
    puts "#{klass.daytimes}      Price: #{klass.price}      #{klass.availability} "
    puts " "
    puts "#{klass.description}"
    puts " "
    puts "Notes:  #{klass.notes}"
    selector_text
  end
end
