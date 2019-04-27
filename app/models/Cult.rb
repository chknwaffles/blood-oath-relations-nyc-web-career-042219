class Cult
  attr_accessor :cult_population
  attr_reader :name, :location, :slogan, :founding_year, :minimum_age

  @@all = []

  def initialize(name, location, founding_year, slogan, min_age)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @minimum_age = min_age
    @cult_population = 0

    @@all << self
  end

  def followers
    bloodoaths = BloodOath.all.select {|bloodoath| bloodoath.cult == self}
    bloodoaths.map {|bloodoaths| bloodoaths.follower }
  end

  def recruit_follower(follower)
    if follower.age < self.minimum_age
      return "Sorry, you are too young to join."
    else
      oath = BloodOath.new(follower, self)
      self.cult_population += 1
    end
  end

  def average_age
    total_age = avg_age = 0.0
    self.followers.each {|follower| total_age += follower.age}
    avg_age = total_age / self.followers.size
  end

  def my_followers_motto
    self.followers.each {|follower| puts follower.life_motto}
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    @@all.find {|cult| cult.name == name}
  end

  def self.find_by_location(location)
    @@all.find {|cult| cult.location == location}
  end

  def self.find_by_founding_year(year)
    @@all.find {|cult| cult.founding_year == year}
  end

  def self.least_popular
    @@all.min {|a, b| a.population <=> b.population}
  end

  def self.most_common_location
    most_common = ""
    cults_size = 0
    location_hash = @@all.group_by {|cult| cult.location}
    location_hash.each do |location, cults|
      if cults.length > cults_size
        cults_size = cults.length
        most_common = location
        #binding.pry
      end
    end
    most_common
  end
end
