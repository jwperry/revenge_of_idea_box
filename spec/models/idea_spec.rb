require 'rails_helper'

RSpec.describe Idea, type: :model do
  it "can be created" do
    expect(Idea.all.count).to eq(0)
    idea = create(:idea)
    expect(Idea.all.count).to eq(1)
    expect(Idea.all.first.title).to eq(idea.title)
    expect(Idea.all.first.body).to eq(idea.body)
    expect(Idea.all.first.quality).to eq(idea.quality)
  end

  it "must have a title" do
    expect(Idea.all.count).to eq(0)
    Idea.create(body: "body1", quality: 0)
    expect(Idea.all.count).to eq(0)
  end

  it "must have a unique title" do
    expect(Idea.all.count).to eq(0)
    Idea.create(title: "title1", body: "body1", quality: 0)
    expect(Idea.all.count).to eq(1)
    Idea.create(title: "title1", body: "body1", quality: 0)
    expect(Idea.all.count).to eq(1)
  end

  it "must have a body" do
    expect(Idea.all.count).to eq(0)
    Idea.create(title: "title1", quality: 0)
    expect(Idea.all.count).to eq(0)
  end

  it "has a default quality of Swill" do
    expect(Idea.all.count).to eq(0)
    idea = Idea.create(title: "title1", body: "body1")
    expect(idea.quality).to eq("Swill")
  end

  it "correctly returns quality from idea enum" do
    idea1 = Idea.create(title: "Idea1", body: "Body1", quality: 0)
    idea2 = Idea.create(title: "Idea2", body: "Body2", quality: 1)
    idea3 = Idea.create(title: "Idea3", body: "Body3", quality: 2)
    expect(idea1.quality).to eq("Swill")
    expect(idea2.quality).to eq("Plausible")
    expect(idea3.quality).to eq("Genius")
  end
end
