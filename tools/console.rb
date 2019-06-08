require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

vans = Startup.new("Vans", "Teddy Jones", "Shoes")
adidas = Startup.new("Adidas", "John Jones", "Shoes")
nike = Startup.new("Nike", "Rick", "Shoes")

billy = VentureCapitalist.new("Billy", 2000000000)
frank = VentureCapitalist.new("Frank", 2)
jerry = VentureCapitalist.new("Jerry", 10000000)

r1 = FundingRound.new(vans, billy, "seed", 10000)
r2 = FundingRound.new(adidas, frank, "angel", 10000)
r3 = FundingRound.new(nike, jerry, "seed", 1900000)



binding.pry
0 #leave this here to ensure binding.pry isn't the last line