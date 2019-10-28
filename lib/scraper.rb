class Scraper

  def self.scrape_klasses
    html = open("https://classes.bullseyeglass.com/classes-events.html")
    doc = Nokogiri::HTML(html)

      doc.css("div.category-products").css("li.item.last").each do |item|
        klass = Klass.new
        klass.title  = item.css(".product-name a[title]").text.strip.split(",")[0]
        klass.link  = item.css("a").attribute("href").value
      end
  end

  def self.scrape_klass_details(klass)

  end

end
