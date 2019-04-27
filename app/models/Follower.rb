class Follower
  attr_reader :name, :age, :life_motto

  @@all = []

  def initialize(name, age, life_motto)
    @name = name
    @age = age
    @life_motto = life_motto

    @@all << self
  end

  def cults
    bloodoaths = BloodOath.all.select {|bloodoath| bloodoath.follower}
    bloodoaths.map {|bloodoath| bloodoath.cult}
  end

  def join_cult(cult)
    if self.age < cult.minimum_age
      return "Sorry, you are too young to join."
    else
      oath = BloodOath.new(self, cult)
      cult.cult_population += 1
    end
  end

  def my_cults_slogans
    self.cults.each {|cult| puts cult.slogan}
  end

  def fellow_cult_members
    self.cults.select do |cult|
      cult.followers.select do |follower|
        follower.cults.include?(self.cults)
      end
    end
  end

  def self.all
    @@all
  end

  def self.of_a_certain_age(age)
    @@all.select {|follower| follower.age == age}
  end

  def self.most_active
    @@all.max {|a, b| a.cults.length <=> b.cults.length}
  end

  def self.top_ten
    @@all.sort_by {|follower| follower.cults.length}
  end
end
