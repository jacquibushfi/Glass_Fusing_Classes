require "nokogiri"
require "open-uri"
require "pry"

def run
  puts "       Welcome to the Bullseye Class Listing"
  puts "Upcoming Classes in Glass fusing, Kilncasting, Coldworking"
  puts " "
  puts "----------------------------------------------------------"
  puts " "

  html = open("https://classes.bullseyeglass.com/classes-events.html")
  doc = Nokogiri::HTML(html)
  binding.pry
end
