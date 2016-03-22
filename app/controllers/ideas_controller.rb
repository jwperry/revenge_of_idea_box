class IdeasController < ApplicationController
  respond_to :json, :html

  def index
    all_ideas = { ideas: Idea.all }
    respond_with all_ideas
  end

  def new
  end

  def create
    Idea.create(idea_params)
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :body)
  end

end
