class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @profiles = Profile.all
    respond_with(@profiles)
  end

  def show
    respond_with(@profile)
  end

  def new
    @user = current_user
    @profile = @user.profiles.build
    respond_with(@profile)
  end

  def edit
  end

  def create
    @user = current_user
    @profile = @user.profiles.build(profile_params)
    @profile.save
    redirect_to root_path
    flash[:notice] = "Profile has been created."
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
