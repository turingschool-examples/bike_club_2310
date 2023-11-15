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
end