class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :img_url, :full_name, :current_industry, :current_position, :current_company
  has_many :messages
end
