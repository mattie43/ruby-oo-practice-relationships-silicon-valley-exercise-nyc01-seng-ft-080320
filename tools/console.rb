require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

startup1 = Startup.new("Startup 1", "Matt", "startup1.com")
startup2 = Startup.new("Startup 2", "John", "startup2.com")
startup3 = Startup.new("Startup 3", "Steve", "startup3.com")
startup4 = Startup.new("Startup 4", "Liam", "startup4.com")
startup5 = Startup.new("Startup 5", "Travis", "startup5.com")

vent1 = VentureCapitalist.new("Andrew")
vent2 = VentureCapitalist.new("Alicia")
vent3 = VentureCapitalist.new("Sam")

fund1 = FundingRound.new(startup1, vent1, "Series A", 1234567890)
fund2 = FundingRound.new(startup2, vent2, "Series B", 75000000)
fund3 = FundingRound.new(startup3, vent2, "Series C", 65000000)
fund4 = FundingRound.new(startup4, vent3, "Series D", 90000000)
fund5 = FundingRound.new(startup5, vent3, "Series E", 15000000)
fund6 = FundingRound.new(startup5, vent3, "Series F", 15000000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line