class List < ActiveRecord::Base
	belongs_to :user
	has_many :tasks

	validates :user, presence: true
	validates :name, presence: true
	validates :privacy, presence: true
	#validates :status, presence: true

	before_save :set_status_open

	private

	def set_status_open
	 self.status = 'open'
	end
end
