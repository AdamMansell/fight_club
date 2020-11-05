require 'rails_helper'

RSpec.describe "Fighters", type: :request do
  describe "GET /fighters" do
    let!(:fighter) do
      Fighter.create(
        name: 'Adam', 
        age: 21, 
        weight: 160, 
        height: 182,
        type_of_fighter: "Muay Thai"
      )
    end
    before do
      get fighters_path
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
      expect(response).to have_http_status(200)
    end

    it "JSON body response contains expected fighter attributes and their values" do
      json_response = JSON.parse(response.body).first
      expect(json_response.keys).to match_array(%w[id name age weight height type_of_fighter created_at])
      expect(json_response['name']).to eq 'Adam'
      expect(json_response['age']).to eq 21
      expect(json_response['weight']).to eq 160
      expect(json_response['height']).to eq 182
      expect(json_response['type_of_fighter']).to eq "Muay Thai"
    end
  end
end
