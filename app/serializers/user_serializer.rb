class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :gravatar_url, :created_at, :updated_at
end
