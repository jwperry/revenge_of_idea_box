class IdeasController < ApplicationController
  respond_to :json, :html

  def index
    ideas = Idea.all.map { |idea| {idea: idea, tags: idea.tags} }
    all_ideas = { ideas: ideas }
    @tags = Tag.all
    respond_with all_ideas
  end

  def create
    Idea.new.create_idea_with_tags(idea_params)
    render nothing: true
  end

  def destroy
    idea = Idea.find(params[:id])
    idea.tags.delete_all
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
    params.require(:idea).permit(:title, :body, :tags)
  end

end
