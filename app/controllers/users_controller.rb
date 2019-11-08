class UsersController < ApplicationController
    def create
        game = Game.find(1)
        user = User.new(name: params[:name], game_id: game.id)
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
end
