class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :img_url, :full_name
end
