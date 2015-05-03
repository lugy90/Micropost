class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	# These validation just effect in memory not in database( before data saving in the database )
	validates :name,  presence: true, length: { maximum: 50 }
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	
	validates :email, 
	          presence: true, 
	          format: { with: VALID_EMAIL_REGEX }, 
	          uniqueness: { case_sensitive: false } # Same chars diff case can`t go through
    
    has_secure_password   

    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true                                     
end
