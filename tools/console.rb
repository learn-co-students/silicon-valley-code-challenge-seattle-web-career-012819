require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#initialize(name, founder, domain, pivot)
startup1 = Startup.new("micNet", "Mr.1", "10.168.171.1", "micnet:10.168")
startup2 = Startup.new("pcNet", "Mr.2", "10.168.171.2", "pcNet:10.165")
startup3 = Startup.new("mobileNet", "Mr.3", "10.168.171.3", "mobileNet:10.171")

capitalist1 = VentureCapitalist.new("Mike", 100000010)
capitalist2 = VentureCapitalist.new("Nick", 1200000000)
capitalist3 = VentureCapitalist.new("Bill", 1300000000)
capitalist4 = VentureCapitalist.new("Raik", 910000000)

#initialize(startup, venture_capitalist, type, investment)

funding1 = FundingRound.new(startup1, capitalist1, "series A", 5000.0)
funding2 = FundingRound.new(startup3, capitalist2, "series B", 7000.0)
funding3 = FundingRound.new(startup2, capitalist3, "series X", 15000.0)
funding4 = FundingRound.new(startup1, capitalist4, "series Y", 55000.0)
funding5 = FundingRound.new(startup1, capitalist1, "series Z", 56000.0)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line
