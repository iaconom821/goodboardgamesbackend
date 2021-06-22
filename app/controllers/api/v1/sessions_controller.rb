class Api::V1::SessionsController < ApplicationController
  before_action :set_session, only: [:show, :update, :destroy]
  before_action :logged_in?
  # GET /sessions
  def index
    @sessions = Session.all

    render json: @sessions
  end

  # GET /sessions/1
  def show
    @user = @session.winner_profile
    render json: { session: @session, winning_user: @user, players: @session.players }
  end

  # POST /sessions
  def create
    byebug
    @session = Session.new(session_params)
    
    if @session.valid?
      @session.save
      params["players"].each{|player| Usersession.create(session: @session , user: User.find(player), date: session_params["date"])}
      render json: @session, status: :created
    else
      render json: @session.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sessions/1
  def update
    if @session.update(session_params)
      render json: @session
    else
      render json: @session.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sessions/1
  def destroy
    @session.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = Session.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def session_params
      params.require(:session).permit(:date, :boardgame_id, :winner, :players)

      params.require(:session).permit(:date, :boardgame_id, :winner)
    end
end
