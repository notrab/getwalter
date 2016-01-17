class User < ActiveRecord::Base
  include Clearance::User

  has_many :forms, dependent: :destroy

  validates :name, presence: true

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
    super(only: [:name, :email],
      methods: [:first_name, :last_name, :gravatar_url])
  end
end
