class Job < ActiveRecord::Base
  belongs_to :company

  def self.search(search)
  	where("profession LIKE ?", "%#{search}")
  	where("country LIKE ?", "%#{search}")
  	where("city LIKE ?", "%#{search}")

	end
end
