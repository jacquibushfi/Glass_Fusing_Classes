class Klass

  attr_accessor :title, :link
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

end
