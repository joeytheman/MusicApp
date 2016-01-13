class Api::V1::SongResource < JSONAPI::Resource
  attributes :name, :genre, :times_played, :artist

  def self.records(options = {})
    super
      .includes(:artist, :genre)
  end
end
