
class Scraper

  def self.scrape_klasses
    html = open("https://classes.bullseyeglass.com/classes-events.html")
    doc = Nokogiri::HTML(html)

      doc.css("div.category-products").css("li.item.last").each do |item|
        split_title = []
        klass = Klass.new
        klass.title  = item.css(".product-name a[title]").text.strip
        klass.link  = item.css("a").attribute("href").value
        split_title = klass.title.split(",")
          if split_title[1].include? "with"
            klass.location = split_title[2].strip
            klass.date = split_title[3].strip + ", " + split_title[4].strip
          else
            klass.location = split_title[1].strip
            klass.date = split_title[2].strip + ", " + split_title[3].strip
          end
      end
  end

  def self.scrape_klass_details(klass)
    html = open("#{klass.link}")
    doc = Nokogiri::HTML(html)
    klass.price = doc.css("span.price").text
    klass.description = doc.css("div.std p")[0].text
    klass.daytimes = doc.css("div.std p")[1].text
    klass.prequisites = doc.css("div.std p")[3].text
    klass.availability = doc.css("div.extra-info p").text.strip
    klass
   end
end
