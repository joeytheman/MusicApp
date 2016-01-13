class Api::V1::PlaylistsSongResource < JSONAPI::Resource
  has_one :playlist
  has_one :song

  attributes :playlist, :song
end


