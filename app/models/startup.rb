require 'pry'

class Startup
    @@all = []
    attr_accessor :name
    attr_reader :founder, :domain

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def sign_contract(venture_capitalist, investment_type, amount)
        FundingRound.new(self, venture_capitalist, investment_type, amount)
    end

    def funding_rounds
        FundingRound.all.select do |round|
            round.startup == self
        end
    end

    def num_funding_rounds
        self.funding_rounds.count
    end

    def total_funds
        total_investments = 0
        self.funding_rounds.each do |round|
            total_investments += round.investment
        end
        total_investments
    end

    def investors
        self.funding_rounds.map do |round|
            round.venture_capitalist
        end
    end 

    def big_investors
        self.investors.select do |investor|
            investor.total_worth >= 1000000000
        end
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.find_by_founder(founder_name)
        self.all.find do |startup|
            biding.pry
            startup.founder.name == founder_name
        end
    end

    def self.domains
        self.all.map do |startup|
            startup.domain
        end
    end
    
    def self.all
        @@all
    end
end
