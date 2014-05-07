class Subject < ActiveRecord::Base

	has_many :page

	scope :visible, lambda { where(:visible => true) }
	scope :invisible, lambda { where(:visible => false) }
	scope :sorted, lambda { order("subject.position ASC") }
	scope :newest_first, lambda { order("Subject.created_at DESC")
	scope :search, lambda { |query| 
	 	where(["name LIKE ?", "%#{query}"])
	 }
	 	
end 
