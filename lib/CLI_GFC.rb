

class CLI

  def run
    puts "          Welcome to the Bullseye Class Listing"
    puts " "
    puts "Upcoming Classes in Glass fusing, Kilncasting, and Coldworking"
    puts "--------------------------------------------------------------"
    puts " "
  Scraper.scrape_klasses

# loop that asks user what to do until experimenting
print_klasses
  menu
  end


  def menu
    #print_klasses
  end
  def print_klasses
    Klass.all.each.with_index(1) do |klass, index|
    puts "#{index}. #{klass.title}"
    end
  end

end
