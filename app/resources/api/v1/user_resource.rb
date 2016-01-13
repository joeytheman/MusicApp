class Api::V1::UserResource < JSONAPI::Resource
  has_many :playlists

  attributes :username, :email
end
