class Api::V1::GameownersController < ApplicationController
    before_action :authorized, only: [:create, :delete]

    def create
        @gameowner = Gameowner.new(params.require(:gameowner).permit(:user_id, :boardgame_id))
        if @gameowner.valid?
            @gameowner.save
            @user = User.find(params[:user_id])
            
            render json: @user
        else
            render json: {message: "You already own this game"}
        end
    end

    def delete
        game_owner_params = params.require(:gameowner).permit(:user_id, :boardgame_id)
        @gameowner = Gameowner.where("user_id = #{game_owner_params['user_id']} and boardgame_id = #{game_owner_params['boardgame_id']}").take
        @gameowner.destroy
        @user = User.find(game_owner_params['user_id'])
        
        render json: @user 
    end
end
