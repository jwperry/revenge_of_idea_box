class Idea < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :body, presence: true
  validates :quality, presence: true

  enum quality: %w(Swill Plausible Genius)

  def update_quality(change)
    new_quality = self[:quality] + change.to_i
    new_quality = 2 if new_quality > 2
    new_quality = 0 if new_quality < 0
    self.update_attribute(:quality, new_quality)
  end
end
