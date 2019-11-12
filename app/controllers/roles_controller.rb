class RolesController < ApplicationController
    def index
        roles = Role.all.shuffle

        roles[0].hidden = false
        roles[1].hidden = false
        roles[2].hidden = false

        roles[-1].hidden = true
        roles[-2].hidden = true
        roles[-3].hidden = true

        roles.each do |role| 
            role.update(game_id: 1)
        end

        render :json => roles.to_json()
    end
end
