class SteamUsersController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_steam_user, only: [:show, :edit, :update, :destroy]
  respond_to :json

  # GET /steam_users
  # GET /steam_users.json
  def index
    @steam_users = SteamUser.all
    render json: @steam_users
  end

  # GET /steam_users/1
  # GET /steam_users/1.json
  def show
    @steam_user = SteamUser.find(params[:id])
    render json: @steam_user
  end

  # GET /steam_users/new
  def new
    @steam_user = SteamUser.new
  end

  # GET /steam_users/1/edit
  def edit
  end

  # POST /steam_users
  # POST /steam_users.json
  def create
    @steam_user = SteamUser.new(steam_user_params)

    respond_to do |format|
      if @steam_user.save
        format.json { render json: @steam_user }
      else
        format.html { render :new }
        format.json { render json: @steam_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /steam_users/1
  # PATCH/PUT /steam_users/1.json
  def update
    respond_to do |format|
      if @steam_user.update(steam_user_params)
        format.html { redirect_to @steam_user, notice: 'Steam user was successfully updated.' }
        format.json { render :show, status: :ok, location: @steam_user }
      else
        format.html { render :edit }
        format.json { render json: @steam_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /steam_users/1
  # DELETE /steam_users/1.json
  def destroy
    @steam_user.destroy
    respond_to do |format|
      format.html { redirect_to steam_users_url, notice: 'Steam user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_steam_user
      @steam_user = SteamUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def steam_user_params
      params.permit(:user_id, :username, :steamid)
    end
end
