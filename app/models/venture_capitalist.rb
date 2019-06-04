class VentureCapitalist
  attr_accessor :name, :total_worth
  @@all = []
  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    #returns an array of all venture capitalists in the
    #Trés Commas club (they have more then 1,000,000,000 total_worth)
    member_array = []
    self.all.each do |member|
      if member.total_worth > 1000000000
        member_array << member.name
      end
    end
    member_array
  end

  def funding_rounds
    #returns an array of all funding rounds for that venture capitalist
    FundingRound.all.select do |fund|
      fund.venture_capitalist == self
    end
  end

  def portfolio
    #Returns a unique list of all startups this venture capitalist has funded
    startup_funded = []
    self.funding_rounds.each do |start|
      startup_funded << start.startup
    end
    startup_funded.uniq
  end

  def biggest_investment
    #returns the largest funding round given by this venture capitalist
    max =0
    funding_round= ""
    self.funding_rounds.each do |invest|
      if invest.investment > max
        max = invest.investment
        funding_round = invest
      end
    end
    funding_round
  end

  def invested(domain_name)
    #given a domain string, returns the total amount invested in that domain
    total_investment = 0
    FundingRound.all.each do |dom|
      if domain_name == dom.startup.domain
        total_investment += dom.investment
      end
    end
    total_investment
  end
end
