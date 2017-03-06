class Bookmark < ActiveRecord::Base
  belongs_to :list
  belongs_to :user

  validates :list, presence: true
end
