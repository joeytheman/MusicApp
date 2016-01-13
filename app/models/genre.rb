class Genre < ActiveRecord::Base
  has_many :artists, inverse_of: :genre
  has_many :songs, inverse_of: :genre

  validates :name, presence: true
end
