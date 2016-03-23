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

  it "updates quality" do
    idea = create(:idea, quality: 0)
    updates = { ratingChange: "1" }
    expect(idea.quality).to eq("Swill")
    idea.update_quality(updates)
    expect(idea.quality).to eq("Plausible")
  end

  it "doesn't allow quality > 2" do
    idea = create(:idea, quality: 2)
    updates = { ratingChange: "1" }
    expect(idea.quality).to eq("Genius")
    idea.update_quality(updates)
    expect(idea.quality).to eq("Genius")
  end

  it "doesn't allow quality < 0" do
    idea = create(:idea, quality: 0)
    updates = { ratingChange: "-1" }
    expect(idea.quality).to eq("Swill")
    idea.update_quality(updates)
    expect(idea.quality).to eq("Swill")
  end

  it "updates title and body" do
    idea = create(:idea)
    updates = { title: "new_title", body: "new_body" }
    idea.update_title_and_body(updates)
    expect(idea.title).to eq(updates[:title])
    expect(idea.body).to eq(updates[:body])
  end

  it "fully updates idea" do
    idea = create(:idea, quality: 2)
    updates = { title: "new_title", body: "new_body", ratingChange: "-1" }
    idea.update_idea(updates)
    expect(idea.quality).to eq("Plausible")
    expect(idea.title).to eq(updates[:title])
    expect(idea.body).to eq(updates[:body])
  end
end
