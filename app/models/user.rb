class User < ApplicationRecord

	validates :name, presence: true
	validates :userid, presence: true

	# my custom validor that does a quick check
	validate :emailValidator
	validate :idIsValidValidator
	validate :idAlreadyExistsValidator

	# checks if an @ char exists in the email
	def noAt(s)
		s.split("").each do |i|
			if i == '@'
				return false
			end
		end
		return true
	end

	# checks if the last 4 chars in the email is '.com'
	def noDotCom(s)
		if s.chars.last(4).join != ".com"
			return true
		else
			return false
		end
	end

	private

	# complete email validator with @ and .com checks
	def emailValidator
		puts "Inside emailValidator trying to validate email: #{email}"
		if not email.present?
			errors.add(:email, "No email detected")
		end
		# so email exists
		if email.present? and noAt(email)
			errors.add(:email, "No @ symbol detected")
		end
		if email.present? and noDotCom(email)
			errors.add(:email, "No .com specified")
		end
	end

	# complete id validator that checks if id is in proper form
	# Form must be positive integer with at most 6 digits and greater than 0
	def idIsValidValidator
		if userid.present? and userid <= 0
			errors.add(:userid, "User ID must be a positive non-zero integer")
		end
		if userid.present? and userid.digits.count > 6
			errors.add(:userid, "User ID must be less than 999999")
		end
	end

	# complete id validator that checks if id already exists
	def idAlreadyExistsValidator
		puts "Inside idAlreadyExistsValidator trying to insert id number #{userid}"
		User.all.each do |u|
			if userid.present? and u.userid == userid
				errors.add(:userid, "User w/ id #{userid} already exists.")
			end
		end
	end
end