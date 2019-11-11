class GameSerializer < ActiveModel::Serializer
  attributes :id, :num_players, :day, :night, :started, :turn
  has_many :users
end
