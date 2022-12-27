# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Person', type: :request do
  describe 'GET /typehead/prefix' do
    let!(:person_one) { FactoryBot.create(:person, name: 'John Lennon', times: 10) }
    let!(:person_two) { FactoryBot.create(:person, name: 'Paul McCartney', times: 15) }
    let!(:person_three) { FactoryBot.create(:person, name: 'George Harrison', times: 20) }
    let!(:person_four) { FactoryBot.create(:person, name: 'Ringo Starr lennon', times: 20) }
    let!(:string_to_search) { 'lennon' }

    before do
      get "/typehead/#{string_to_search}"
    end

    it 'returns users with lennon on their name ordered by times' do
      expect(json.size).to eq(2)
      expect(json[0]['id']).to eq(person_four.id)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /typehead' do
    let!(:multiple_persons) { FactoryBot.create_list(:person, 200) }

    before do
      allow(ENV)
        .to receive(:[])
        .with('SUGGESTION_NUMBER')
        .and_return(20)
      get '/typehead/'
    end

    it 'returns users with the most popular rating in alphabetical order limited by suggestion_number' do
      most_popular_rating = Person.maximum(:times)
      expect(json.size).to eq(20)
      expect(json[0]['times']).to eq(most_popular_rating)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end
