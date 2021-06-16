class Admin::BoardgamesController < ApplicationController

    before_action :set_boardgame, only: [ :destroy ]

    def destroy
        byebug
        @boardgame.reviews.destroy_all
        
        @del_boardgame = @boardgame.destroy
        render json: @del_boardgame 
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_boardgame
      @boardgame = Boardgame.find(params[:id])
    end
end