require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET /categories' do
    it 'Returns a successful response' do
      get categories_path
      follow_redirect!
      expect(response).to have_http_status(200)
    end
  end
end
