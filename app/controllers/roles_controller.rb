class RolesController < ApplicationController
    def index
        roles = Role.all.shuffle

        roles.each_with_index do |role, index|
            if index < roles.length - 3
                role.hidden = false
            else
                role.hidden = true
            end
            role.update(game_id: 1)
        end

        render :json => roles.to_json()
    end
end
