class Idea < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :body, presence: true
  validates :quality, presence: true
  has_many :idea_tags
  has_many :tags, through: :idea_tags

  enum quality: %w(Swill Plausible Genius)

  def update_idea(updates)
    update_quality(updates) if updates[:ratingChange]
    update_title_and_body(updates) if updates[:title] && updates[:body]
  end

  def update_quality(updates)
    new_quality = self[:quality] + updates[:ratingChange].to_i
    new_quality = 2 if new_quality > 2
    new_quality = 0 if new_quality < 0
    self.update_attribute(:quality, new_quality)
  end

  def update_title_and_body(updates)
    self.update_attribute(:title, updates[:title])
    self.update_attribute(:body, updates[:body])
  end

  def create_idea_with_tags(idea_params)
    idea = Idea.create(title: idea_params["title"], body: idea_params["body"])
    if (idea_params["tags"] && idea_params["tags"] != "")
      tags = idea_params["tags"].split(", ")
      tags.each do |tag|
        idea.tags << Tag.find_or_create_by(name: tag)
      end
    end
  end
end
