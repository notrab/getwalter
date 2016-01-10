class Submission < ActiveRecord::Base
  belongs_to :form

  validates :email, presence: true

  serialize :data, JSON
end
