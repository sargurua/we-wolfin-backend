class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :role, :votes
end
