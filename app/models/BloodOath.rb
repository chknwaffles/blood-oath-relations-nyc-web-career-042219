class BloodOath
  attr_reader :initiation_date, :follower, :cult

  @@all = []

  def initialize(follower, cult)
    @follower = follower
    @cult = cult
    @initiation_date = Time.now.strftime("%Y-%m-%d")
    @@all << self
  end

  def self.all
    @@all
  end

  def self.first_oath
    @@all.first.person
  end
end
