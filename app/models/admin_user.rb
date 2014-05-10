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

	has_secure_password
	
	has_and_belongs_to_many :pages
	has_many :section_edits
	has_many :sections, :through => :section_edits

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
	FORBIDDEN_USERNAME = ['littlebopeep', 'humptydumpty', 'marymary']

	# validates_presence_of :first_name
	# validates_length_of :first_name, :maximum => 25
	# validates_presence_of :last_name
	# validates_length_of :last_name, :maximum => 50
	# validates_presence_of :username 
	# validates_length_of :username, :within => 6..25
	# validates_uniqueness_of :username
	# validates_presence_of :email
	# validates_length_of :email, :maximum => 100
	# validates_format_of :email, :with => EMAIL_REGEX
	# validates_confirmation_of :email
	
	#Sortcut validations, aka "sexy validation"
	validates :first_name,	:presence => true,
							:length => { :maximum => 25 }
	
	validates :username, 	:length => { :within => 8..25 },
							:uniqueness => true
	validates :email,		:presence => true,
							:length => { :maximum => 100 },
							:format => EMAIL_REGEX,
							:confirmation => true

	validate :username_is_allowed
	#validate :no_new_users_on_saturday, :on => :create


	scope :sorted, lambda { order("first_name ASC") }

	def name
		"#{first_name}"

		# first_name + ' ' + last_name
		# [first_name, last_name].join(' ')
	end

	def username_is_allowed
		if FORBIDDEN_USERNAME.include?(username)
			errors.add(:username, "has been restricted from use")
		end
	end

	# Erorrs not related to a spesific attributes
	# can be aded to errors[:base]
	def no_new_users_on_saturday
		if Time.now.day == 6
			errors[:base] << "No new users on Saturdays"
		end
	end
end
