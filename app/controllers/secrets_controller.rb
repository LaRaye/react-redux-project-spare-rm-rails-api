class SecretsController < ApplicationController
  before_action :set_secret, only: [:show, :update, :destroy]

  # GET /secrets
  # GET /secrets.json
  def index
    @secrets = Secret.all
  end

  # GET /secrets/1
  # GET /secrets/1.json
  def show
  end

  # POST /secrets
  # POST /secrets.json
  def create
    @secret = Secret.new(secret_params)

    if @secret.save
      render :show, status: :created, location: @secret
    else
      render json: @secret.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /secrets/1
  # PATCH/PUT /secrets/1.json
  def update
    if @secret.update(secret_params)
      render :show, status: :ok, location: @secret
    else
      render json: @secret.errors, status: :unprocessable_entity
    end
  end

  # DELETE /secrets/1
  # DELETE /secrets/1.json
  def destroy
    @secret.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_secret
      @secret = Secret.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def secret_params
      params.require(:secret).permit(:content, :user_id)
    end
end
