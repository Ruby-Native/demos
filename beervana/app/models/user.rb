class User < ApplicationRecord
  has_many :stamps, dependent: :destroy
  has_many :stamped_breweries, through: :stamps, source: :brewery
  has_many :favorites, dependent: :destroy
  has_many :favorited_breweries, through: :favorites, source: :brewery

  validates :apple_uid, uniqueness: true, allow_nil: true

  def self.from_omniauth(auth)
    find_by(apple_uid: auth.uid) || create!(
      apple_uid: auth.uid,
      email: auth.info.email,
      name: auth.info.name
    )
  end
end
