class Tag < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :idea_tags
  has_many :ideas, through: :idea_tags
end
