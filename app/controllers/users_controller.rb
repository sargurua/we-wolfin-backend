class UsersController < ApplicationController
    def create
        game = Game.find(1)
        user = User.new(name: params[:name], game_id: game.id, role_id: 1)
        if user.save
            ActionCable.server.broadcast 'users_channel', 
                user: user
            head :ok
        end
    end

    def index
        users = User.all
        render json: users.to_json()
    end

    def update
        user = User.find(params[:id])
        role = Role.find(params[:role])
        role.update(game_id: 1)
        user.update(role_id: role.id)
        render :json => user
    end
end
