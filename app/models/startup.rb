class Startup
  attr_reader :founder
  attr_accessor :name, :domain, :pivot
  @@all = []
  def initialize(name, founder, domain, pivot)
    @name = name
    @founder = founder
    @domain = domain
    @pivot = pivot
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_founder(founder_name)
    #given a string of a founder's name, returns the first startup whose founder's name matches
    self.all.find do |founder_|
      founder_.founder == founder_name
    end
  end

  def self.domains
    #should return an array of all of the different startup domains
    self.all.map do |domain_address|
      domain_address.domain
    end
  end

  def sign_contract(venture_capitalist_obj, type, invest_amount)
    # given a venture capitalist object, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.
    FundingRound.new(self, venture_capitalist_obj, type, invest_amount)
  end

  def num_funding_rounds
    #Returns the total number of funding rounds that the startup has gotten
    FundingRound.all.count do |funding_round|
      funding_round.startup == self
    end
  end

  def total_funds #Returns the total sum of investments that the startup has gotten
    sum = 0
    FundingRound.all.each do |fund|
      sum += fund.investment
    end
    sum
  end

  def investors
    #Returns a unique array of all the venture capitalists that have invested in this company
    investor = []
    FundingRound.all.each do |invest|
      if invest.startup == self
        investor << invest.venture_capitalist
      end
    end
    return investor.uniq
  end

  def big_investors
    #Returns a unique array of all the venture capitalists that have invested in this company and are in the Trés Commas club
    big_investor = []
    self.investors.each do |invest|
      if invest.total_worth > 1000000000
        big_investor << invest
      end
    end
    big_investor
  end

end #end of class
