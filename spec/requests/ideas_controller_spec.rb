require "rails_helper"

describe "ideas" do
  describe "GET index" do
    it "returns all ideas" do
      idea1, idea2 = create_list(:idea, 2)
      get "/", format: :json
      json_ideas = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(json_ideas["ideas"].first["title"]).to eq(idea1.title)
      expect(json_ideas["ideas"].first["body"]).to eq(idea1.body)
      expect(json_ideas["ideas"].last["title"]).to eq(idea2.title)
      expect(json_ideas["ideas"].last["body"]).to eq(idea2.body)
    end
  end

  describe "POST create" do
    it "creates an idea" do
      params = {"idea"=>{"title"=>"test_title", "body"=>"test_body"}}
      expect(Idea.all.count).to eq(0)
      post "/ideas", params, format: :json
      expect(Idea.all.count).to eq(1)
      expect(Idea.all.first.title).to eq("test_title")
      expect(Idea.all.first.body).to eq("test_body")
    end
  end

  describe "DELETE destroy" do
    it "deletes an idea" do
      idea = create(:idea)
      expect(Idea.all.count).to eq(1)
      params = { "id" => "#{idea.id}" }
      delete "/ideas/#{idea.id}", params, format: :json
      expect(Idea.all.count).to eq(0)
    end
  end

  describe "PATCH update" do
    it "updates an idea" do
      idea = create(:idea)
      expect(Idea.all.first.title).to eq(idea.title)
      expect(Idea.all.first.body).to eq(idea.body)
      params = {"idea"=>{"title"=>"new_title", "body"=>"new_body"}}
      patch "/ideas/#{idea.id}", params, format: :json
      expect(Idea.all.first.title).to eq("new_title")
      expect(Idea.all.first.body).to eq("new_body")
      expect(Idea.all.count).to eq(1)
    end
  end
end
