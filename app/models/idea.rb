class Idea < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :body, presence: true
  validates :quality, presence: true

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
end
