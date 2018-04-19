class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:complete_profile]

  def index
  end

  def complete_profile
  	@pages = current_user
  end

  def create
  	current_user.role = params[:pages][:role]
  	current_user.save
  	redirect_to root_path, notice: 'Your Role is Saved Successfully.'
  end
end
