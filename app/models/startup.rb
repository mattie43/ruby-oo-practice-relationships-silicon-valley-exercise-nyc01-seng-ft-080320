class Startup
    attr_accessor :name, :domain
    attr_reader :founder
    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(domain, name)
        self.domain = domain
        self.name = name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(name)
        FundingRound.all.each { |fund| return fund.startup if fund.venture_capitalist.name == name }
        "No startup found with founder: #{name}"
    end

    def self.domains
        FundingRound.all.map { |fund| fund.startup }
    end

    def sign_contract(venture_capitalist, type, amount)
        FundingRound.new(self, venture_capitalist, type, amount)
    end

    def num_funding_rounds
        FundingRound.all.reduce(0) { |num, fund| num += 1 if fund.startup == self; num }
    end

    def total_funds
        FundingRound.all.reduce(0) { |num, fund| num += fund.investment if fund.startup == self; num }
    end

    def investors
        FundingRound.all.reduce([]) { |a, fund| a << fund.venture_capitalist if fund.startup == self; a.uniq }
    end

    def big_investors
        tres = VentureCapitalist.tres_commas_club
        self.investors.select { |ele| tres.include?(ele) }
    end
    
end