class ClassfieldsController < ApplicationController
  # before_action :set_classfield, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :index]
  before_action :set_classfield, only: [:show, :edit, :update, :destroy]
  # GET /classfields or /classfields.json
  def index
    if params[:tag_id].present?
      @classfields = Classfield.joins(:tags).where(tags: { id: params[:tag_id].map(&:to_i) }).distinct
    else
      @classfields = current_user.classfields
    end
  end

  # GET /classfields/1 or /classfields/1.json
  def show
    respond_to do |format|
      format.html
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("modal",partial: "classfield",locals:{classfield: @classfield})
      end
    end
  end

  # GET /classfields/new
  def new
    @classfield = Classfield.new
  end

  # GET /classfields/1/edit
  def edit
  end

  # POST /classfields or /classfields.json
  def create
    @classfield = current_user.classfields.build(classfield_params)

    respond_to do |format|
      if @classfield.save
        format.html { redirect_to my_classfields_url(@classfield), notice: "Classfield was successfully created." }
        format.json { render :index, status: :created, location: @classfield }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @classfield.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classfields/1 or /classfields/1.json
  def update
    respond_to do |format|
      if @classfield.update(classfield_params)
        format.html { redirect_to classfield_url(@classfield), notice: "Classfield was successfully updated." }
        format.json { render :show, status: :ok, location: @classfield }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @classfield.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classfields/1 or /classfields/1.json
  def destroy
    @classfield.destroy!

    respond_to do |format|
      format.html { redirect_to my_classfields_url, notice: "Classfield was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_classfield
      @classfield = Classfield.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "Classfield not found."
      redirect_to my_classfields_path
    end

    # Only allow a list of trusted parameters through.
    def classfield_params
      params.require(:classfield).permit(:title, :description, :status, :user_id, :category_id, tag_id: [])
    end
end
