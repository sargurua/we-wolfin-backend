class Role < ApplicationRecord
    belongs_to :game, optional: true
end
