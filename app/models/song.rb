class Song < ActiveRecord::Base
  belongs_to :artist, inverse_of: :songs
  belongs_to :genre, inverse_of: :songs

  has_many :playlists, through: :playlists_songs, inverse_of: :songs
  has_many :playlists_songs, inverse_of: :song, dependent: :destroy

  validates :artist, presence: true, associated: true
  validates :genre, presence: true, associated: true
  validates :name, presence: true
end
