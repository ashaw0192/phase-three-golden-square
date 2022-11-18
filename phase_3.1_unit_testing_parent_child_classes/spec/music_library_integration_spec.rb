require 'music_library'
require 'track'

RSpec.describe "integration" do

  it "adds and lists tracks" do
    music_library = MusicLibrary.new
    track1 = Track.new("title1", "artist1")
    track2 = Track.new("title2", "artist2")
    music_library.add(track1)
    music_library.add(track2)
    expect(music_library.all).to eq [track1, track2] 
  end

  it "searches tracks by title" do
    music_library = MusicLibrary.new
    track1 = Track.new("one two three", "artist1")
    track2 = Track.new("four five six", "artist2")
    music_library.add(track1)
    music_library.add(track2)
    expect(music_library.search("one")).to eq [track1] 
  end

  it "searches tracks by artist" do
    music_library = MusicLibrary.new
    track1 = Track.new("title1", "one two three")
    track2 = Track.new("title2", "four five six")
    music_library.add(track1)
    music_library.add(track2)
    expect(music_library.search("four")).to eq [track2] 
  end
  
end