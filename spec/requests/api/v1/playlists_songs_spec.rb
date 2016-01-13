require 'rails_helper'

RSpec.describe 'API::V1 PlaylistsSpng Spec', type: :request do
  describe 'Retrieving playlists for the given user' do
    subject { get "/api/v1/users/#{user.id}/playlists" }

    before do
      FactoryGirl.create_list :playlist, 11, user: user
    end

    context 'for the given user' do
      let!(:user) { FactoryGirl.create :user }
      it 'returns a list of playlists' do
        subject
        expect(json_data.count).to eq 10
        validate_objects json_data, Playlist.first(10), [:name], [:user]
      end

      it 'returns the pagination links' do
        subject
        validate_pagination_for 'first', 1, 10
        validate_pagination_for 'next', 2, 10
        validate_pagination_for 'last', 2, 10
      end
    end
  end

  describe 'Creating a playlist' do
    subject { post "/api/v1/playlists", { data: data_params }.to_json, { 'Content-Type' => 'application/vnd.api+json' } }
    let(:user) { FactoryGirl.create :user }
    let(:data_params) do
      {
        'type' => 'playlists',
        attributes: attribute_params,
        relationships: relationship_params
      }
    end
    let(:attribute_params) do
      {
        name: 'My new playlist'
      }
    end

    let(:relationship_params) do
      {
        user: {
          data: {
            id: user.id,
            type: 'users'
          }
        }
      }
    end

    it 'creates a new playlist' do
      expect{ subject }.to change{ user.playlists.count }.from(0).to(1)
      object = Playlist.last
      expect(object.name).to eq 'My new playlist'
      expect(object.user_id).to eq user.id
    end
  end
end

