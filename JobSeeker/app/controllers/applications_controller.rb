class ApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_classfield, only: [:new, :update, :index, :create]
  before_action :set_application, only: [:update]

  def index
    @applications= @classfield.applications.includes(user: :recieved_reviews)
  end

  def new
    @application = @classfield.Application.new
  end

  def create
    @application = @classfield.applications.build(user: current_user,status: "pending")

    if @application.save
      respond_to do |format|
        format.turbo_stream { flash.now[:notice] = "You have successfully applied for this job!" }
        format.html { redirect_to classfield_applications_path(@classfield), notice: "You have successfully applied for this job!" }
      end
    else
      respond_to do |format|
        format.turbo_stream { flash.now[:alert] = "Unable to apply for this job." }
        format.html { redirect_to categories_path, alert: "Unable to apply for this job." }
      end
    end


    # if @application.save
    #   redirect_to classfield_applications_path, notice: "You have successfully applied for this job!"
    # else
    #   redirect_to categories_path, notice: "Unable to apply for this job."
    # end
  end


  def update
    if @application.update(application_params)
      redirect_to classfield_applications_path(@application.classfield), notice: "Application status updated"
    else
      redirect_to classfield_applications_path(@application.classfield), alert: "Unable to update application status"
    end
  end

  def user_applications
    @applications = current_user.applications
  end

  private


  def set_classfield
    @classfield = Classfield.find(params[:classfield_id])
  end

  def set_application
    @application = Application.find(params[:id])
  end

  def application_params
    params.require(:application).permit(:status)
  end
end
