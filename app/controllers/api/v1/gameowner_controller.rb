class Api::V1::GameownerController < ApplicationController
    before_action :authorized, only: [:create, :destroy]

    def create
        @gameowner = Gameowner.new(params.require(:gameowner).permit(:user_id, :boardgame_id))
        if @gameowner.valid?
            @gameowner.save 
            @boardgame = Boardgame.find(params[:boardgame_id])
            @user = User.find(params[:user_id])

            render json: {boardgame: @boardgame, user: @user}
        else
            render json: {message: "You already own this game"}
        end
    end
end
