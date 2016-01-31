class User < ActiveRecord::Base
  has_secure_password

  has_many :forms, dependent: :destroy

  validates :email, :name, presence: true
  validates :email, uniqueness: true

  def gravatar_url
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=60"
  end
end
