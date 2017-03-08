class Bookmark < ActiveRecord::Base
  belongs_to :list
  belongs_to :user

  validates :user, presence: true
  validates :list, presence: true

end
