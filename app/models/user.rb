class User < ActiveRecord::Base
  has_many :playlists, inverse_of: :user

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
end
