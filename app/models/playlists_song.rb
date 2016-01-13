class PlaylistsSong < ActiveRecord::Base
  belongs_to :playlist, inverse_of: :playlists_songs
  belongs_to :song, inverse_of: :playlists_songs

  validates :playlist, presence: true, associated: true
  validates :song, presence: true, associated: true
end
