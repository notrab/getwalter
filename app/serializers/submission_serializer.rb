class SubmissionSerializer < ActiveModel::Serializer
  attributes :id, :email, :data, :created_at
end
