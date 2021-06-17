class Api::V1::UsersessionsController < ApplicationController
  before_action :set_usersession, only: [:show, :update, :destroy]

  # GET /usersessions
  def index
    @usersessions = Usersession.all

    render json: @usersessions
  end

  # GET /usersessions/1
  def show
    render json: @usersession
  end

  # POST /usersessions
  def create
    @usersession = Usersession.new(usersession_params)

    if @usersession.save
      render json: @usersession, status: :created, location: @usersession
    else
      render json: @usersession.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /usersessions/1
  def update
    if @usersession.update(usersession_params)
      render json: @usersession
    else
      render json: @usersession.errors, status: :unprocessable_entity
    end
  end

  # DELETE /usersessions/1
  def destroy
    @usersession.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usersession
      @usersession = Usersession.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def usersession_params
      params.require(:usersession).permit(:date, :session_id, :user_id)
    end
end
