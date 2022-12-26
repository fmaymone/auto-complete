require 'rails_helper'

RSpec.describe 'Person', type: :request do
  describe 'GET /search' do
    let!(:person_one) { FactoryBot.create(:person, name: 'John Lennon', times: 10) }
    let!(:person_two) { FactoryBot.create(:person, name: 'Paul McCartney', times: 15) }
    let!(:person_three) { FactoryBot.create(:person, name: 'George Harrison', times: 20) }
    let!(:person_four) { FactoryBot.create(:person, name: 'Ringo Starr lennon', times: 20) }

    before do
      get '/typehead/lennon'
    end

    it 'returns all posts' do
      expect(json.size).to eq(2)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end
