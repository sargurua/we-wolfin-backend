class GamesController < ApplicationController
    def index 
        games = Game.all
        render :json => games
    end

    def create
        game = Game.new(day: params[:day].to_i, night: params[:night].to_i, num_players: params[:num_players].to_i, started: false)
        if(game.save)
            user = User.find_or_create_by(name: params[:name], game_id: game.id, role_id: 1)
            serialized_data = ActiveModelSerializers::Adapter::Json.new(
            GameSerializer.new(game)
            ).serializable_hash
            ActionCable.server.broadcast 'games_channel', serialized_data
            head :ok
        end
    end

    def show
        game = Game.find(1)
        render :json => game
        # serialized_data = ActiveModelSerializers::Adapter::Json.new(
        # GameSerializer.new(game)
        # ).serializable_hash
        # ActionCable.server.broadcast 'games_channel', serialized_data
        # head :ok
    end

    def seperate
        Game.destroy_all
        User.destroy_all
    end

    def update
        game = Game.find(params[:id])
        game.update(started: params[:started])
        render :json => game
    end

    def changeTurn
        game = Game.find(1)
        game.update(turn: params[:newTurn])
        render :json => game
    end

    def robber
        robber = User.all.find(params[:robber_id])
        selected = User.all.find(params[:selected_id])

        robber_role_id = robber.role.id
        selected_role_id = selected.role.id

        robber.update(role_id: selected_role_id)
        selected.update(role_id: robber_role_id)
    end

    def trouble
        first = User.all.find(params[:first_id])
        second = User.all.find(params[:second_id])

        first_role_id = first.role.id
        second_role_id = second.role.id

        first.update(role_id: second_role_id)
        second.update(role_id: first_role_id)
    end

    def vote 
        user = User.all.find(params[:user_id])
        newVotes = user.votes += 1
        user.update(votes: newVotes)
    end
end
