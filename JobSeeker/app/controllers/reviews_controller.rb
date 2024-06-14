class ReviewsController < ApplicationController
  before_action :set_application, only: [:new, :create, :index]

  def index
  end

  def new
    @review = Review.new
  end

  def create
    @review = @application.build_review(review_params)
    @review.user = current_user
    @review.classfield = @application.classfield
    @review.review_type = poster_review

    if @review.save
      redirect_to classfield_applications_path(@application.classfield), notice: 'Review was successfully created.'
    else
      puts @review.errors.full_messages
      render :new
    end
  end

  def new_applicant_review
    @review = Review.new
  end

  def create_applicant_review
    @review = @application.build_review(review_params)
    @review.user = current_user
    @review.classfield = @application.classfield
    @review.review_type = applicant_review

    if @review.save
      redirect_to classfield_applications_path(@application.classfield), notice: 'Review was successfully created.'
    else
      puts @review.errors.full_messages
      render :new_applicant_review
    end
  end

  private

  def set_application
    @application = Application.find(params[:application_id])
  end

  def review_params
    params.require(:review).permit(:rating, :note)
  end
end
