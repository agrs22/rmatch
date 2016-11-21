class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :party, :picture, :aditional_data
end
