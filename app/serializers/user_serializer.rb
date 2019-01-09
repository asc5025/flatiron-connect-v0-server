class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :avatar, :full_name
end
