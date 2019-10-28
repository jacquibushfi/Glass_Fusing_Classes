

class CLI

  def run
    puts "          Welcome to the Bullseye Class Listing"
    puts " "
    puts "Upcoming Classes in Glass fusing, Kilncasting, and Coldworking"
    puts "--------------------------------------------------------------"
    puts " "
  Scraper.scrape_klasses
  menu
  input = gets.strip.downcase

  while input != 'exit' do
     input.to_i.between?(1, Klass.count)
      klass_input = Klass.all[input.to_i - 1]
      Scraper.scrape_klass_details(klass_input) if !klass_input.title
      #display_klass_details(kd)
      puts " "
      puts "#{klass_input.title}"
      puts " "
      puts "#{klass_input.description}"
      puts " "
      puts "#{klass_input.price}"
      puts " "
      puts "Enter 'list' to see the list, a class number, or 'exit' to exit"
      input = gets.strip.downcase
    # elsif input == "list"
    #   menu
    #     input = gets.strip.downcase
    # else
    #   puts "Please enter a valid selection"
    #   menu
    #     input = gets.strip.downcase
    end
    "Goodbye"
  end

    def display_klass_details(kd)
      puts " "
      puts "#{kd.title}"
      puts " "
      puts "#{kd.description}"
      puts " "
      puts "#{kd.price}"
      puts "Enter 'list' to see the list, a class number, or 'exit' to exit"
    end

  def menu
    display_klasses
    puts " "
    puts "Please Select the number of a class to see more information,  type 'list' to see the list again, or  'exit' to exit"
    end

  def display_klasses
    Klass.all.each.with_index(1) do |klass, index|
    puts "#{index}. #{klass.title}"
    end
  end

end
