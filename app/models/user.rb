class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
          :validatable, :omniauthable, omniauth_providers: [:facebook, :twitter]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name   # assuming the user model has a name
      user.email = User.dummy_email(auth)
      user.password = Devise.friendly_token[0,20]
      user.image = auth.info.image.gsub("_normal","") if user.provider == "twitter"
      user.image = auth.info.image.gsub("picture","picture?type=large") if user.provider == "facebook"
    end
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
