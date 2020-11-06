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

  describe "GET /fighters/:id" do
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
      get "/fighters/#{fighter.id}"
    end

    it "returns http success" do      
      expect(response).to have_http_status(200)
    end

    it "JSON body response contains expected fighter attributes and their values" do
      json_response = JSON.parse(response.body)
      expect(json_response.keys).to match_array(%w[id name age weight height type_of_fighter created_at])
      expect(json_response['name']).to eq 'Adam'
      expect(json_response['age']).to eq 21
      expect(json_response['weight']).to eq 160
      expect(json_response['height']).to eq 182
      expect(json_response['type_of_fighter']).to eq "Muay Thai"
    end      
  end

  describe "POST /fighters" do
    context 'all the required fighter attributes are present in the params' do
      before do
        post fighters_path, params: { fighter: { name: 'Adam', age: 21, weight: 160, height: 182, type_of_fighter: 'Muay Thai'} }
      end
  
      it "returns http success" do      
        expect(response).to have_http_status(201)
      end
  
      it "JSON body response contains expected fighter attributes and their values" do
        json_response = JSON.parse(response.body)
        expect(json_response.keys).to match_array(%w[id name age weight height type_of_fighter created_at])
        expect(json_response['name']).to eq 'Adam'
        expect(json_response['age']).to eq 21
        expect(json_response['weight']).to eq 160
        expect(json_response['height']).to eq 182
        expect(json_response['type_of_fighter']).to eq "Muay Thai"
      end
    end

    context 'some required fighter attributes are missing in the params' do
      before do
        post fighters_path, params: { fighter: { weight: 160, height: 182, type_of_fighter: 'Muay Thai'} }
      end
  
      it "returns http success" do
        expect(response).to have_http_status(422)
      end
  
      it "JSON body response contains the error messages" do
        json_response = JSON.parse(response.body)
        expect(json_response['name']).to eq ["can't be blank"]
        expect(json_response['age']).to eq ["can't be blank"]
      end
    end    
  end  
end
