class IdeasController < ApplicationController
  respond_to :json, :html

  def index
    all_ideas = { ideas: Idea.all }
    respond_with all_ideas
  end

  def create
    Idea.create(idea_params)
    render nothing: true
  end

  def destroy
    idea = Idea.find(params[:id])
    idea.destroy
    render nothing: true
  end

  def update
    idea = Idea.find(params[:id])
    idea.update_idea(params[:idea]) if params[:idea]
    render nothing: true
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :body)
  end

end
