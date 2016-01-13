genres = FactoryGirl.create_list :genre, 20
artists = FactoryGirl.create_list :artist, 50
playlists = FactoryGirl.create_list :playlist, 100

songs = Array.new(500) do |num|
  FactoryGirl.create :song, genre: genres.sample, artist: artists.sample
end

1000.times do |num|
  FactoryGirl.create :playlists_song, song: songs.sample, playlist: playlists.sample
end


