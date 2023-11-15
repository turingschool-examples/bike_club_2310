require 'spec_helper'

RSpec.describe BikeClub do
  before(:each) do
    @bike_club = BikeClub.new("Sunset Riders")
    @biker = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
  end

  describe "#intialize" do
    it "exists" do
      expect(@bike_club).to be_a(BikeClub)
    end

    it "has readable attibutes" do
      expect(@bike_club.name).to eq("Sunset Riders")
      expect(@bike_club.bikers).to eq([])
    end
  end

  describe "#add_biker" do
    it "can add bikers to the bike club" do
      @bike_club.add_biker(@biker)

      expect(@bike_club.bikers).to eq([@biker])
    end
  end  

  describe "#most_rides" do
    it "can tell us which Biker has logged the most rides" do
      @bike_club.add_biker(@biker)
      @bike_club.add_biker(@biker2)

      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)

      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)

      @biker2.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:hills)

      @biker2.log_ride(@ride1, 95.0)
      @biker2.log_ride(@ride2, 65.0)

      expect(@bike_club.most_rides).to eq(@biker)
    end
  end
end