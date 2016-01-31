class FormSerializer < ActiveModel::Serializer
  attributes :id, :name, :recipients, :has_submissions, :last_submission, :created_at

  has_many :submissions
end
