class VentureCapitalist
    @@all = []
    attr_accessor :name, :total_worth

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def offer_contract(startup, investment_type, investment)
       FundingRound.new(startup, self, investment_type, investment) 
    end

    def funding_rounds
        FundingRound.all.select do |round|
            round.venture_capitalist == self
        end
    end

    def portfolio
        self.funding_rounds.map do |round|
            round.startup
        end
    end

    def biggest_investment
        self.funding_rounds.max_by {|round| round.investment}
    end

    def invested(domain)
        total_domain_investments = 0
        self.portfolio.each do |startup|
            if startup.domain == domain
                total_domain_investments += startup.total_funds
            end
        end
        total_domain_investments
    end

    def self.tres_commas_club
        self.all.select do |capitalist|
            capitalist.total_worth >= 1000000000
        end
    end
    
    def self.all
        @@all
    end
end
