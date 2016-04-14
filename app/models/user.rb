class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :portfolios, foreign_key: "owner_id", dependent: :destroy
  # after_create :create_account
  # before_create :build_default_account


  validates :first_name, :last_name, :user_name, :email, :password_hash, presence: true
  validates :user_name, :email, uniqueness: true

  # private
  #   def build_default_account
  #     # build default profile instance. Will use default params.
  #     # The foreign key to the owning User model is set automatically
  #     build_account
  #     true # Always return true in callbacks as the normal 'continue' state
  #          # Assumes that the default_profile can **always** be created.
  #          # or
  #          # Check the validation of the profile. If it is not valid, then
  #          # return false from the callback. Best to use a before_validation 
  #          # if doing this. View code should check the errors of the child.
  #          # Or add the child's errors to the User model's error array of the :base
  #          # error item
  #   end


  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(password)
    self.password == password
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
