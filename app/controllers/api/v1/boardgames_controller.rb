class Api::V1::BoardgamesController < ApplicationController
  before_action :authorized, only: [:create, :update, :destroy]
  before_action :set_boardgame, only: [ :show, :update, :destroy ]

  # GET /boardgames
  # GET /boardgames.json
  def index
    @boardgames = Boardgame.all
    render json: @boardgames 
  end

  # GET /boardgames/1
  # GET /boardgames/1.json
  def show
    render json: @boardgame
  end

  # POST /boardgames
  # POST /boardgames.json
  def create
    @boardgame = Boardgame.new(boardgame_params)

    if @boardgame.save
      render :show, status: :created, location: @boardgame
    else
      render json: @boardgame.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /boardgames/1
  # PATCH/PUT /boardgames/1.json
  def update
    if @boardgame.update(boardgame_params)
      render :show, status: :ok, location: @boardgame
    else
      render json: @boardgame.errors, status: :unprocessable_entity
    end
  end

  # DELETE /boardgames/1
  # DELETE /boardgames/1.json
  def destroy
    @boardgame.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boardgame
      @boardgame = Boardgame.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def boardgame_params
      params.require(:boardgame).permit(:title, :manufacturer, :description)
    end
end
