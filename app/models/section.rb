class Section < ActiveRecord::Base

	has_many :section_edits
	has_many :editor, :through => :section_edits, :class_name => "AdminUsers"

end
