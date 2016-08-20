class Company < ActiveRecord::Base
	has_many :jobs
	validates :title, presence: true, length: { minimum: 1 }

	def self.search(search)
		where("title LIKE ?", "%#{search}%")
		
	end
end
