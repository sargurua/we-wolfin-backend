class GameSerializer < ActiveModel::Serializer
  attributes :id, :num_players, :day, :night
  has_many :users
end
