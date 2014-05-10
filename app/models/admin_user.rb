class AdminUser < ActiveRecord::Base

	# to configure a different table name:
	# self.table_name = "admin_users"
	
	# #short way
	# attr_accessor :first_name
	
	# #long way
	# def last_name
	# 	@last_name
	# end

	# def last_name=(value)
	# 	@last_name
	# end
	has_and_belongs_to_many :pages
	has_many :section_edits
	has_many :sections, :through => :section_edits

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
	validates_presence_of :first_name
	validates_length_of :first_name, :maximum => 25
	validates_presence_of :last_name
	validates_length_of :last_name, :maximum => 50
	validates_presence_of :username 
	validates_length_of :username, :within => 6..25
	validates_uniqueness_of :username
	validates_presence_of :email
	validates_length_of :email, :maximum => 100
	validates_format_of :email, :with => EMAIL_REGEX
	validates_confirmation_of :email
	
end