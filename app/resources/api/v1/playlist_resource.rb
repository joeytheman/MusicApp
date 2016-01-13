class Api::V1::PlaylistResource < JSONAPI::Resource
  has_many :songs
  has_one :user

  attributes :name, :user
end

