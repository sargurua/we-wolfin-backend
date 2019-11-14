class User < ApplicationRecord
    belongs_to :game
    belongs_to :role ,optional: true
end
