class VentureCapitalist

  @@all = []

  attr_accessor :name, :total_worth

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth

    @@all << self
  end

  def self.all
    @@all
  end


  def self.tres_commas_club
    self.all.select{|vc| vc.total_worth > 1000000000}
  end

end
