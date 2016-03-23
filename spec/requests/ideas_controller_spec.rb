require "rails_helper"

describe "ideas" do
  describe "GET index" do
    it "returns all ideas" do
      idea1, idea2 = create_list(:idea, 2)
      get "/", format: :json
      json_ideas = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(json_ideas["ideas"].first["title"]).to eq(idea1.title)
      expect(json_ideas["ideas"].first["body"]).to eq(idea1.body)
      expect(json_ideas["ideas"].last["title"]).to eq(idea2.title)
      expect(json_ideas["ideas"].last["body"]).to eq(idea2.body)
    end
  end
end
