require 'rails_helper'

RSpec.describe Genre, type: :model do
  context 'Associations' do
    it { is_expected.to have_many(:artists) }
    it { is_expected.to have_many(:songs) }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
