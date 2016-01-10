class User < ActiveRecord::Base
  include Clearance::User

  has_many :forms
end
