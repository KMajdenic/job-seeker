class ApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_classfield, only: [:index, :create]
  before_action :set_application, only: [:update]

  def create
    @application = @classfield.applications.build(user: current_user,status: "pending")

    if @application.save
      redirect_to classfield_applications_path(@classfield), notice: "You have successfully applied for this job!"
    else
      redirect_to @classfield, notice: "Unable to apply for this job."
    end
  end

  def index
    @applications= @classfield.applications.includes(user: :recieved_reviews)
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
