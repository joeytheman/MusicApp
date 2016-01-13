require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Associations' do
    it { is_expected.to have_many(:playlists).inverse_of(:user) }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:username) }
  end
end
