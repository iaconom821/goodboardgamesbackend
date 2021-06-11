class Api::V1::GameownersController < ApplicationController
    before_action :authorized, only: [:create, :destroy]

    def create
        @gameowner = Gameowner.new(params.require(:gameowner).permit(:user_id, :boardgame_id))
        if @gameowner.valid?
            @gameowner.save
            @user = User.find(params[:user_id])
            
            render json: {user: @user}, methods: :owned_games
        else
            render json: {message: "You already own this game"}
        end
    end
end