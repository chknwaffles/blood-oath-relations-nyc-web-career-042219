require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

follower1 = Follower.new("F1", 40, "MOTTO1")
follower2 = Follower.new("F2", 40, "motto2")
follower3 = Follower.new("F3", 23, "motto3")
follower4 = Follower.new("F4", 23, "motto4")
follower5 = Follower.new("F5", 22, "motto5")
follower6 = Follower.new("F6", 26, "motto6")
follower7 = Follower.new("F7", 29, "motto7")

cult = Cult.new("The Cult", "shhhhh", 1991, "slogan1", 40)
cult2 = Cult.new("The Cult 2", "shhhhh", 1992, "slogan2", 20)
cult3 = Cult.new("The Cult 3", "not saying", 1993, "slogan3", 20)

cult.recruit_follower(follower1)
cult.recruit_follower(follower2)
cult.recruit_follower(follower3)
follower1.join_cult(cult)
follower2.join_cult(cult)
follower3.join_cult(cult)
follower4.join_cult(cult)
cult2.recruit_follower(follower1)
cult2.recruit_follower(follower5)
cult2.recruit_follower(follower6)
cult2.recruit_follower(follower7)
cult3.recruit_follower(follower6)

binding.pry

#follower1 = cult1, scientology, church_of_trump
#follower2 = church_of_trump, cult


puts "Mwahahaha!" # just in case pry is buggy and exits
