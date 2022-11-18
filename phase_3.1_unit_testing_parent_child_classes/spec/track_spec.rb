require 'track'

RSpec.describe Track do
  it "constructs" do
    expect(Track.new("", "")).to be_an_instance_of Track
  end



  it "matches when given an empty keyword" do
    track = Track.new("title1", "artist1")
    expect(track.matches?("")).to eq true
  end



  it "doesn't match when given a keyword and an empty track and artist" do
    track = Track.new("", "")
    expect(track.matches?("keyword")).to eq false
  end



  it "doesn't match when given a keyword that does not occur in title or artist" do
    track = Track.new("title1", "artist1")
    expect(track.matches?("keyword")).to eq false
  end


  context "when matches? is called with a keyword that matches title, artist, or both" do
    it "returns true" do
      track = Track.new("title1", "artist1")
      expect(track.matches?("title")).to eq true
      expect(track.matches?("artist")).to eq true
      expect(track.matches?("ti")).to eq true
    end
  end
  
end