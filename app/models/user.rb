class User < ActiveRecord::Base
  has_secure_password

  has_many :forms, dependent: :destroy

  validates :email, :name, presence: true

  def first_name
    name.split(' ').first
  end

  def last_name
    name.split(' ').last
  end

  def gravatar_url
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=60"
  end

  def as_json(options={})
    super(only: [:id, :name, :email],
      methods: [:first_name, :last_name, :gravatar_url])
  end
end
