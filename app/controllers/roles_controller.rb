class RolesController < ApplicationController
    def index
        roles = Role.all
        render :json => roles.shuffle.to_json()
    end
end
