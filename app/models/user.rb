class User < ApplicationRecord
	validates :name, presence: true
	validates :userid, presence: true
	validate :emailValidator

	def noAt(s)
		s.split("").each do |i|
			if i == '@'
				return false
			end
		end
		return true
	end

	private

	def emailValidator
		puts "INSIDE VALIDATOR W/ EMAIL: #{email}"
		if not email.present?
			errors.add(:email, "No email detected")
		else
			# so email exists
			if noAt(email)
				errors.add(:email, "No @ symbol detected")
			end
		end
	end
end
