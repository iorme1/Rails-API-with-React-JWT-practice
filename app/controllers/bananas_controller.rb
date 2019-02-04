class BananasController < ApplicationController
  before_action :authenticate_user
  before_action :set_banana, only: [:show, :update, :destroy]

  # GET /bananas
  # GET /bananas.json
  def index
    if current_user.admin?
      @bananas = Banana.all
      render json: @bananas
    end
  end

  # GET /bananas/1
  # GET /bananas/1.json
  def show
  end

  # POST /bananas
  # POST /bananas.json
  def create
    @banana = Banana.new(banana_params)

    if @banana.save
      render :json, @banana, status: :created, location: @banana
    else
      render json: @banana.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bananas/1
  # PATCH/PUT /bananas/1.json
  def update
    if @banana.update(banana_params)
      render :show, status: :ok, location: @banana
    else
      render json: @banana.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bananas/1
  # DELETE /bananas/1.json
  def destroy
    @banana.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_banana
      @banana = Banana.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def banana_params
      params.require(:banana).permit(:name, :location)
    end
end
