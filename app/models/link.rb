class Link < ApplicationRecord

	before_validation :initialize_token
	validates_presence_of :token, :original_url
	validates_uniqueness_of :token

	class << self
		def generate_token
			random_str_length = 6
			random_str = SecureRandom.urlsafe_base64(random_str_length).tr('-','_')
			secure_final_char = SecureRandom.hex(1)

			random_str[-1] = secure_final_char
			random_str
		end
	end

	def initialize_token
		return if token.present?

		new_token = nil
		loop do
			new_token = Link.generate_token

			break unless existing_token(new_token)
		end

		self.token = new_token
	end

	def existing_token(new_token)
		Link.find_by(token: new_token)
	end
end
