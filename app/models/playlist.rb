class Playlist < ActiveRecord::Base
  belongs_to :user, inverse_of: :playlists

  has_many :songs, through: :playlists_songs, inverse_of: :playlists
  has_many :playlists_songs, inverse_of: :playlist, dependent: :destroy

  validates :name, presence: true
  validates :user, presence: true, associated: true
end
