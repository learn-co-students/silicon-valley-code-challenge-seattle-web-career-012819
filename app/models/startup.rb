class Startup

  @@all = []

  attr_reader :founder, :domain

  attr_accessor :name

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain

    @@all << self
  end

  def self.all
    @@all
  end

  # how can you change the name and domain when your are explicity told not too, without creating a whole new startup
  def pivot(domain, name)
    Startup.new(name, self.founder, self.domain)
  end

  def self.find_by_founder(founder)
    self.all.find{|startup| startup.founder == founder}
  end

  def self.domains
    self.all.map{|startup| startup.domain}
  end

end
