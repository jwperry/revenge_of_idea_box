class IdeasController < ApplicationController
  respond_to :json, :html

  def index
    all_ideas = { ideas: Idea.all }
    respond_with all_ideas
  end
end
