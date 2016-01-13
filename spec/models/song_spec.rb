require 'rails_helper'

RSpec.describe Song, type: :model do
  context 'Associations' do
    it { is_expected.to belong_to(:artist).inverse_of(:songs) }
    it { is_expected.to belong_to(:genre).inverse_of(:songs) }
    it { is_expected.to have_many(:playlists).inverse_of(:songs) }
    it { is_expected.to have_many(:playlists_songs).inverse_of(:song).dependent(:destroy) }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of :artist }
    it { is_expected.to validate_presence_of :genre }
    it { is_expected.to validate_presence_of :name }
  end
end
