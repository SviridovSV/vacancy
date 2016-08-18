class Company < ActiveRecord::Base
	has_many :jobs
	validates :title, presence: true, length: { minimum: 1 }
end
