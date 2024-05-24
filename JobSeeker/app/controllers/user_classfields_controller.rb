class UserClassfieldsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_classfield, only: [:create, :index]
  before_action :set_user_classfield, only: [:update]

  def create
    @user_classfield = @classfield.user_classfields.build(user: current_user,status: "pending")

    if @user_classfield.save
      redirect_to classfield_user_classfields_path(@classfield), notice: "You have successfully applied for this job!"
    else
      redirect_to @classfield, notice: "Unable to apply for this job."
    end
  end

  def index
    @user_classfields= @classfield.user_classfields
  end

  def update
    if @user_classfield.update(user_classfield_params)
      redirect_to classfield_user_classfields_path(@user_classfield.classfield), notice: "Application status updated"
    else
      redirect_to classfield_user_classfields_path(@user_classfield.classfield), alert: "Unable to update application status"
    end
  end

  def user_applications
    @user_classfields = current_user.user_classfields
  end

  private

  def set_classfield
    @classfield = Classfield.find(params[:classfield_id])
  end

  def set_user_classfield
    @user_classfield = UserClassfield.find(params[:id])
  end

  def user_classfield_params
    params.require(:user_classfield).permit(:status)
  end
end
