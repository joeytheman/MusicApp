require 'rails_helper'

RSpec.describe Artist, type: :model do
  context 'Associations' do
    it { is_expected.to belong_to(:genre).inverse_of(:artists) }
    it { is_expected.to have_many(:songs).inverse_of(:artist).dependent(:destroy) }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:genre) }  
    it { is_expected.to validate_presence_of(:name) }
  end
end
