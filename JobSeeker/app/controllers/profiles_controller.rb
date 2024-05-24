#frozen_string_literal: true
class ProfilesController < ApplicationController
  before_action :authenticate_user!
  # before_action :check_setup_complete, except: [:edit, :update]
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      @user.update(setup_complete: true)
      redirect_to users_profiles_path, notice: "Profile updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  # def check_setup_complete
  #   if current_user.setup_complete?
  #     redirect_to edit_users_profiles_path
  #   end
  # end

  def user_params
    params.require(:user).permit(:name, :surname, :phone_number, :bio)
  end

end
