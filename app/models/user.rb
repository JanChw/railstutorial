class User < ActiveRecord::Base
	# attr_accessor :remember_token
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :name, presence: true, length: { maximum: 50}
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	 validates :password, presence: true, length: { minimum: 6}
	before_save { self.email = email.downcase}
	before_create :create_remember_token
	has_secure_password
	has_many :microposts, dependent: :destroy

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	def feed
		microposts
	end

	private
		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end
end
