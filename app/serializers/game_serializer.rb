class GameSerializer < ActiveModel::Serializer
  attributes :id, :num_players, :day, :night, :started, :turn, :voting
  has_many :users
  has_many :roles
end
