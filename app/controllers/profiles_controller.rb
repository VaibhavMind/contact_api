class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      redirect_to profiles_path, notice: "The profile #{@profile.name} has been uploaded."
    else
      render "new"
    end

  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    redirect_to profiles_path, notice:  "The profile #{@profile.name} has been deleted."
  end

  private
  def profile_params
    params.require(:profile).permit(:name, :attachment)
  end
end
