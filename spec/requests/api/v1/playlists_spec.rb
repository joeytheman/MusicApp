require 'rails_helper'

RSpec.describe 'API::V1 Playlist Spec', type: :request do
  describe 'Retrieving playlists for the given user' do
    subject { get "/api/v1/users/#{user.id}/playlists" }

    before { FactoryGirl.create_list :playlist, 11, user: user }

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
      expect(response.status).to eq 201
      object = Playlist.last
      expect(object.name).to eq 'My new playlist'
      expect(object.user_id).to eq user.id
    end
  end

  describe 'Adding a song to a playlist' do
    subject { post "/api/v1/playlists-songs", { data: data_params }.to_json, { 'Content-Type' => 'application/vnd.api+json' } }
    let(:playlist) { FactoryGirl.create :playlist }
    let(:song) { FactoryGirl.create :song }
    let(:data_params) do
      {
        'type' => 'playlists_songs',
        attributes: attribute_params,
        relationships: relationship_params
      }
    end
    let(:attribute_params) do
      {
      }
    end

    let(:relationship_params) do
      {
        playlist: {
          data: {
            id: playlist.id,
            type: 'playlists'
          }
        },
        song: {
          data: {
            id: song.id,
            type: 'songs'
          }
        }
      }
    end

    it 'adds a new song to the playlist' do
      expect{ subject }.to change{ playlist.songs.count }.from(0).to(1)
      expect(response.status).to eq 201
      object = PlaylistsSong.last
      expect(object.playlist_id).to eq playlist.id
      expect(object.song_id).to eq song.id
    end
  end

  describe 'Retrieving songs for the given playlist' do
    subject { get "/api/v1/playlists/#{playlist.id}/songs" }

    before { FactoryGirl.create_list :playlists_song, 11, playlist: playlist }

    context 'for the given playlist' do
      let!(:playlist) { FactoryGirl.create :playlist }
      it 'returns a list of playlists' do
        subject
        expect(json_data.count).to eq 10
        validate_objects json_data, playlist.songs.first(10), [:name, :times_played], [:artist, :genre]
      end

      it 'returns the pagination links' do
        subject
        validate_pagination_for 'first', 1, 10
        validate_pagination_for 'next', 2, 10
        validate_pagination_for 'last', 2, 10
      end
    end
  end
end
