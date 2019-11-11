class GameSerializer < ActiveModel::Serializer
  attributes :id, :num_players, :day, :night, :started
  has_many :users
end
