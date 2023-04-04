require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "cannot create a cat without valid attributes" do 
    it "doesn't create a cat without a name" do 
      cat_params = {
        name: "Chai",
        age: 3,
        enjoys: "Chaos and Havok",
        image: "https://images.unsplash.com/photo-1610878237189-81306e16bd89?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80",
      }
      post '/cats', params: cat_params 
      expect(response.status).to eq 422

      cat = JSON.parse(response.body)
      expect(json['name']).to include "can't be blank"
    end
  end
    it "doesn't create a cat without an age" do 
      cat_params = {
        name: "Chai",
        age: 3,
        enjoys: "Chaos and Havok",
        image: "https://images.unsplash.com/photo-1610878237189-81306e16bd89?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80",
        }

      post '/cats', params: cat_params 
      expect(response.status).to eq 422
      cat = JSON.parse(response.body)
      expect(json['age']).to include "can't be blank"
    end

    it "doesn't create a cat without an enjoys" do 
      cat_params = {
        name: "Chai",
        age: 3,
        enjoys: "Chaos and Havok",
        image: "https://images.unsplash.com/photo-1610878237189-81306e16bd89?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80",
      }

      post '/cats', params: cat_params 
      expect(response.status).to eq 422
      cat = JSON.parse(response.body)
      expect(json['enjoys']).to include "can't be blank"
    end

    it "doesn't create a cat without an image" do 
      cat_params = {
        name: "Chai",
        age: 3,
        enjoys: "Chaos and Havok",
        image: "https://images.unsplash.com/photo-1610878237189-81306e16bd89?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80" 
      }
      post '/cats', params: cat_params 
      expect(response.status).to eq 422
      cat = JSON.parse(response.body)
      expect(json['image']).to include "can't be blank"
    end
  end


