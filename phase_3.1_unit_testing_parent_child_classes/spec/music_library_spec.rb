require 'music_library' 

RSpec.describe MusicLibrary do

  it "adds and lists tracks" do
    music_library = MusicLibrary.new
    track1 = double :track
    track2 = double :track
    music_library.add(track1)
    music_library.add(track2)
    expect(music_library.all).to eq [track1, track2]
  end

  it "searches tracks by title" do
    music_library = MusicLibrary.new
    track1 = double :track
    expect(track1).to receive(:matches?).with("keyword").and_return(true)
    track2 = double :track
    expect(track2).to receive(:matches?).with("keyword").and_return(false)
    music_library.add(track1)
    music_library.add(track2)
    expect(music_library.search("keyword")).to eq [track1]
  end

  it "searches by artist" do
    music_library = MusicLibrary.new
    track1 = double :track, matches?: true
    track2 = double :track, matches?: false
    music_library.add(track1)
    music_library.add(track2)
    expect(music_library.search("keyword")).to eq [track1]
  end
end