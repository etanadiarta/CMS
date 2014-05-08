 class SectionEdit < ActiveRecord::Base

	belong_to :editor, :class_name => "AdminUser", :foreign_key => "admin_user_id"
	belong_to :section

end
