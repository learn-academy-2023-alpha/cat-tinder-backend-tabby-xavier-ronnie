require 'rails_helper'

RSpec.describe Cat, type: :model do
  it "should validate name" do
    cat = Cat.create( age: 3,
      enjoys: "Chaos and Havok",
      image: "https://images.unsplash.com/photo-1610878237189-81306e16bd89?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80",)
      expect(cat.errors[:name]).to_not be_empty
      expect(cat.errors[:name]).to include "can't be blank"
  end
  it " should have an age " do
    cat = Cat.create(name: "Chai",
      enjoys: "Chaos and Havok",
      image: "https://images.unsplash.com/photo-1610878237189-81306e16bd89?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80",)
      expect(cat.errors[:age]).to_not be_empty
      expect(cat.errors[:age].length).to eq 1
  end
  it " should enjoy something" do
    cat = Cat.create(name: "Chai",
      age: 3,
      image: "https://images.unsplash.com/photo-1610878237189-81306e16bd89?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80",
    )
    expect(cat.errors[:enjoys]).to_not be_empty
  end
  it "should have an image" do
    cat = Cat.create(name:"Chai",
        age: 3,
        enjoys: "Chaos and Havok",
    )
    expect(cat.errors[:image]).to_not be_empty
  end
  it 'it must have an enjoys entry at least 10 characters long 'do
    cat = Cat.new(
      name: "Chai",
      age: 3,
      enjoys:"Chaos and Havok",
      image: "https://images.unsplash.com/photo-1610878237189-81306e16bd89?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80",
    )
    expect(cat).to be_valid
  end
end
