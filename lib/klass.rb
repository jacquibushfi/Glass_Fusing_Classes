class Klass

  attr_accessor :title, :link, :description, :price #list out the other elements
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

end
