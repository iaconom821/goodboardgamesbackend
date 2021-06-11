class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:login, :create]
  before_action :set_user, only: [ :show, :update, :destroy ]
  

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    render json: @users 
  end

  # GET /users/1
  # GET /users/1.json
  def show
    render json: @user
  end

  # POST /users
  # POST /users.json
  def create
    new_hash = user_params
    new_hash[:password] = params[:password]
    @user = User.new(new_hash)
    if @user.valid?
      @user.save
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}, methods: :owned_games
    else
      render json: {error: "Invalid username or password"}
    end
  end

  # LOGIN /login
  def login
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}, methods: :owned_games
    else
      render json: {error: "Invalid username or password"}
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      render :show, status: :ok, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :username, :email, :password_digest, :profile_picture)
    end
end
