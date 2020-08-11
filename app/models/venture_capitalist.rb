class VentureCapitalist
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def total_worth
        FundingRound.all.reduce(0) { |num, fund| num += fund.investment if fund.venture_capitalist == self; num}
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        all.select { |vent| vent.total_worth > 1000000000 }
    end

    def offer_contract(startup, type, amount)
        FundingRound.new(startup, self, type, amount)
    end

    def funding_rounds
        FundingRound.all.select { |fund| fund.venture_capitalist == self }
    end

    def portfolio
        FundingRound.all.reduce([]) { |a, fund| a << fund.startup if fund.venture_capitalist == self; a.uniq }
    end

    def biggest_investment
        self.funding_rounds.sort_by { |fund| fund.investment }.last
    end

    def invested(domain)
        self.funding_rounds.reduce(0) { |num, fund| num += fund.investment if fund.startup.domain == domain; num }
    end

end

# - `VentureCapitalist#invested`
#   - given a **domain string**, returns the total amount invested in that domain