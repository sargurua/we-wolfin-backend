class RolesController < ApplicationController
    def index
        roles = Role.all.shuffle

        roles[-1].hidden = true
        roles[-2].hidden = true
        roles[-3].hidden = true

        render :json => roles.to_json()
    end
end
