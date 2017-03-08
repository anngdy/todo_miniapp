class Task < ActiveRecord::Base
  belongs_to :list

  validates :list, presence: true
  validates :title, presence: true
end
