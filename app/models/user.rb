class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  # ,omniauth_providers: %i(google)

	validates :name, {presence: true}
	validates :email, {presence: true, uniqueness: true}
	validates :password, {presence: true}

	has_one_attached :image
  

	def posts
		return Post.where(user_id: self.id)
	end

  protected
  def self.find_for_oauth(auth)
    # user = User.find_by(email: auth.info.email)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(name: auth.info.name,
                         email: auth.info.email,
                         provider: auth.provider,
                         uid: auth.uid,
                         token: auth.credentials.token,
                         password: Devise.friendly_token[0, 20],
                         meta: auth.to_yaml)
    end
    user
  end
end
