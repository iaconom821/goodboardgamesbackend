class Api::V1::ReviewsController < ApplicationController
  before_action :authorized, only: [:create, :update, :destroy]
  before_action :set_review, only: [ :show, :update, :destroy ]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)

    if @review.valid?
      @review.save 
      @boardgame = Boardgame.find(params[:boardgame_id])
      render json: @boardgame, status: :created 
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    if @review.update(review_params)
      @boardgame = Boardgame.find(params[:boardgame_id])
      render json: @boardgame, status: :ok
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @del_review = @review.destroy
    @boardgame = Boardgame.find(@del_review.boardgame_id)
    render json: @boardgame 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:title, :description, :overall_rating, :replayability, :first_time_difficulty, :user_id, :boardgame_id)
    end
end
