class GamesController < ApplicationController
    def index 
        games = Game.all
        render :json => games
    end

    def create
        game = Game.new(day: params[:day].to_i, night: params[:night].to_i, num_players: params[:num_players].to_i)
        if(game.save)
            user = User.find_or_create_by(name: params[:name], game_id: game.id)
            serialized_data = ActiveModelSerializers::Adapter::Json.new(
            GameSerializer.new(game)
            ).serializable_hash
            ActionCable.server.broadcast 'games_channel', serialized_data
            head :ok
        end
    end

    def show
        game = Game.find(1)
        serialized_data = ActiveModelSerializers::Adapter::Json.new(
        GameSerializer.new(game)
        ).serializable_hash
        ActionCable.server.broadcast 'games_channel', serialized_data
        head :ok
    end
end
