

class CLI
  attr_reader :input

  def run
    puts "          Welcome to the Bullseye Class Listing"
    puts " "
    puts "Upcoming Classes in Glass fusing, Kilncasting, and Coldworking"
    puts "--------------------------------------------------------------"
    puts " "
  Scraper.scrape_klasses
  menu
  input = gets.strip.downcase

   while input != 'exit'  do
  #   elsif input.to_i.between?(1, Klass.count)
       klass = Klass.all[input.to_i - 1]
       Scraper.scrape_klass_details(klass)   # if !klass.title
        binding.pry
       display_klass_details(klass)
       puts " "
       puts "Enter 'list' to see the list, a class number, or 'exit' to exit"
       input = gets.strip.downcase
   end
    puts "Goodbye"
  end

    def display_klass_details(klass)
      puts " "
      puts "#{klass.title}"
      puts " "
      puts "#{klass.description}"
      puts " "
      puts "#{klass.price}"
    end

  def menu
      Klass.all.each.with_index(1) do |klass, index|
      puts "#{index}. #{klass.title}"
    end
    puts " "
    puts "Please Select the number of a class to see more information,  type 'list' to see the list again, or  'exit' to exit"
  end

end
