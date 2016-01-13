require 'rails_helper'

RSpec.describe PlaylistsSong, type: :model do
  context 'Associations' do
    it { is_expected.to belong_to(:playlist).inverse_of(:playlists_songs) }
    it { is_expected.to belong_to(:song).inverse_of(:playlists_songs) }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:playlist) }
    it { is_expected.to validate_presence_of(:song) }
  end
end
