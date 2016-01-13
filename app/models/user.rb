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

  def as_json(options={})
    super(only: [
      :name,
      :email
    ])
  end
end
