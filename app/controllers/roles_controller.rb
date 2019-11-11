class RolesController < ApplicationController
    def index
        roles = Role.all
        render :json => roles.to_json()
    end
end
