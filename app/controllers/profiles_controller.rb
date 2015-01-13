class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update, :destroy]

  respond_to :html

  def index
    # transforming the index action to show the last profile of a user
    @user = current_user
    @profile = @user.profiles.last
    respond_with(@profiles)
  end

  def show
    @user = current_user
    @profile = @user.profile
  end

  def new
    @user = current_user
    @profile = @user.build_profile
  end

  def edit
  end

  def create
    @user = current_user
    @profile = @user.build_profile(profile_params)
    @profile.save
    redirect_to root_path
    flash[:notice] = "Your profile has been created."
  end

  def update
    @profile.update(profile_params)
    respond_with(@profile)
  end

  def destroy
    @profile.destroy
    respond_with(@profile)
  end

  private
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:description, :user_id, :image)
    end
end
