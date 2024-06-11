class UsersController < ApplicationController
  before_action :authenticate_user!, only: [ :index]


  def index
    if params[:tag_ids].present?
      @classfields = Classfield.joins(:tags).where(tags: { id: params[:tag_ids].map(&:to_i) }).distinct
    else
      @classfields = current_user.classfields
    end
  end

  private



end
