class ProfilesController < ApplicationController
  before_action :set_profile, only: [:destroy]

  respond_to :html

  def index
    # transforming the index action to show the last profile of a user
    @user = current_user
    @profile = @user.profiles.last
    respond_with(@profiles)
  end

  def show
    @user = User.find(params[:user_id])
    @profile = @user.profile
  end

  def new
    @user = current_user
    @profile = @user.build_profile
  end

  def edit
    @user = current_user  
    @profile = @user.profile  
  end

  def create
    @user = current_user
    @profile = @user.build_profile(profile_params)
    if @profile.save
    redirect_to user_profile_path(@user)
    flash[:notice] = "Your profile has been created."
    else
    redirect_to user_profile_path(@user)
    flash[:notice] = "Failure. Sorry Profile was not created."    
    end 
  end

  def update
    @user = current_user
    @profile = @user.profile
    @profile.update(profile_params)
    respond_with(@user,@profile)
    flash[:notice] = "Your profile has been edited."
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
      params.require(:profile).permit(:description, :user_id, :image, :image_file_name, :image_content_type, :image_file_size, :image_updated_at)
    end
end
