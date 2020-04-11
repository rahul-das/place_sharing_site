class UsersController < ApplicationController
  before_action :set_user, only: :show

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if @user == current_user
      redirect_to places_url
    else
      @shared_places = @user.created_places.shared_with(current_user)
      @shared_places += @user.created_places.where(is_public: true)
      if @shared_places.blank?
        redirect_to users_url, notice: "There's no shared place with you by this user."
      end
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.fetch(:user, {})
    end
end
