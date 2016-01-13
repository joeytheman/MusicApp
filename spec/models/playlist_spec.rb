require 'rails_helper'

RSpec.describe Playlist, type: :model do
  context 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:songs).inverse_of(:playlists) }
    it { is_expected.to have_many(:playlists_songs).inverse_of(:playlist).dependent(:destroy) }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:user) }
  end
end
