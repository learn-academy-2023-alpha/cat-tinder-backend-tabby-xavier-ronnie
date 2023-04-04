require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it "gets a list of cats" do
      Cat.create(
        name: "Chai",
        age: 3,
        enjoys: "Chaos and Havok",
        image: "https://images.unsplash.com/photo-1610878237189-81306e16bd89?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80",
      )
      get '/cats'
      cat = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(cat.length).to eq 1
    end
  end
  describe "POST/ create" do 
    it "creates a cat" do
      cat_params = {
        cat: {  name: "Chai",
          age: 3,
          enjoys: "Chaos and Havok",
          image: "https://images.unsplash.com/photo-1610878237189-81306e16bd89?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80"
        }
      }
      post '/cats', params: cat_params
      expect(response).to have_http_status(200)
      cat = Cat.first
      expect(cat.name). to eq 'Chai'
    end
  end
  describe "PATCH/update" do
    it "updates a cat" do
      cat_params = {
        cat: {  
          name: "Chai",
          age: 3,
          enjoys: "Chaos and Havok",
          image: "https://images.unsplash.com/photo-1610878237189-81306e16bd89?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80"
        }
      }
      post '/cats', params: cat_params
      cat = Cat.first
      updated_cat_params = {
        cat: {  
          name: "Chai",
          age: 4,
          enjoys: "Chaos and Havok",
          image: "https://images.unsplash.com/photo-1610878237189-81306e16bd89?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80"
        }
      } 
      patch "/cats/#{cat.id}", params: updated_cat_params
      updated_cat = Cat.find(cat.id)
      expect(response).to have_http_status(200)
      expect(updated_cat.age).to eq 4
    end
  end
    describe "DELETE/destroy" do
      it "will delete a cat" do
        cat_params = {
          cat: {  
            name: "Chai",
            age: 3,
            enjoys: "Chaos and Havok",
            image: "https://images.unsplash.com/photo-1610878237189-81306e16bd89?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80"
          }
        }
        post '/cats', params:cat_params
        cat = Cat.first
        cats = Cat.all
        delete "/cats/#{cat.id}"
        expect(response).to have_http_status(200)
        expect(cats).to be_empty 
      end
    end
end
