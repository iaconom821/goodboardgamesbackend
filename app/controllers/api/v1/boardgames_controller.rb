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

    if @boardgame.valid?
      @boardgame.save 
      render json: @boardgame, status: :created
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
    @boardgame.reviews.destroy_all
    @boardgame.gameowners.destroy_all
    @boardgame.destroy
  end

  # POST /scanned_game

  def scanned_game
    
    @response = HTTParty.get(
      "https://api.upcitemdb.com/prod/trial/lookup?upc=#{boardgame_params[:upc_code]}"
    )

    @scanned_boardgame = Boardgame.new(title: @response["items"][0]["title"], description: @response["items"][0]["description"], manufacturer: @response["items"][0]["brand"], upc_code: boardgame_params[:upc_code], image: @response["items"][0]["images"][0])

    # Boardgame.new(title: @response["items"][0]["title"], description: @response["items"][0]["description"], manufacturer: @response["items"][0]["images"][0])
    if @scanned_boardgame.valid?
      @scanned_boardgame.save

      render json: @scanned_boardgame
    else

      render json: {message: "Invalid game"}
    end    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boardgame
      @boardgame = Boardgame.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def boardgame_params
      params.require(:boardgame).permit(:title, :manufacturer, :description, :upc_code)
    end
end
