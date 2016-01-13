class Artist < ActiveRecord::Base
  belongs_to :genre, inverse_of: :artists

  has_many :songs, inverse_of: :artist, dependent: :destroy

  validates :genre, presence: true, associated: true
  validates :name, presence: true
end
