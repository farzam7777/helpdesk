class ServicesController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	before_action :set_category, only: [:edit, :update, :new, :create, :destroy, :show, :index]
	before_action :set_service, only: [:edit, :update, :destroy, :show]
	before_action :check_permission, only: [:edit, :destroy, :new, :create, :update]

	has_scope :search_by, using: %i[title type], type: :hash

	def index
		user = params[:user]
		if user_signed_in?
			@user = User.find user.to_i
		end

		if defined?(params[:search_by][:type]).nil?
			return redirect_to category_path(@category)
		end

		if params[:search_by][:type] == ''
			params[:search_by][:type] = '!@!@#%#$@@##!@#^%&'
		end

		if params[:search_by][:title] == ''
			params[:search_by][:title] = '!@!@#%#$@@##!@#^%&'
		end

		if params[:commit] == "Reset" or ( params[:search_by][:type] == '!@!@#%#$@@##!@#^%&' and params[:search_by][:title] == '!@!@#%#$@@##!@#^%&' )
			params[:search_by][:type] = ''
			params[:search_by][:title] = ''
		end

		if params[:commit] == "Reset"
			@check = true
		end

		if !user_signed_in?
			@user_status = false
      @user_permission = false
      @services = apply_scopes(@category.services.where(status: 'public')).all
    else
			if current_user == @category.user or ( @category.users.include? current_user and @category.permission_status(current_user) and@category.permission(current_user) == "Manage" )
	  		@services = apply_scopes(@category.services).all
	      @invitation = Invitation.new
	  		@user_status = true
	      @user_permission = true
	    elsif current_user == @category.user or ( @category.users.include? current_user and @category.permission_status(current_user) and@category.permission(current_user) == "Read" )
	      @services = apply_scopes(@category.services).all
	      @invitation = Invitation.new
	      @user_status = true
	      @user_permission = false
	  	else
	  		@services = apply_scopes(@category.services.where(status: 'public')).all
	  		@user_status = false
	      @user_permission = false

	      if @category.users.include? current_user
		      @user_status = true
		    end
	  	end
	  end
	  @services = Kaminari.paginate_array(@services).page(params[:page]).per(2)
  	respond_to do |format|
      format.html {  }
      format.js
    end
  end

  def new
  	@service = Service.new
  end

  def create
  	@service = @category.services.build(service_params)
  	if @service.save
  		redirect_to category_service_path(@category, @service), notice: 'Service is successfully created'
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @service.update service_params
  		redirect_to [@category, @service], notice: 'Service Successfully Updated.'
  	else
  		render :edit
  	end	
	end
  
  def show
  end

  def destroy
  	if @service.destroy
  		redirect_to @category, notice: 'Service Successfully Deleted.'
  	end
  end

  private

  	def service_params
	  	params.require(:service).permit!
	  end

	  def set_category
	  	@category = Category.find(params[:category_id])	
	  end

	  def set_service
	  	@service = Service.find(params[:id])	
	  end

	  def check_permission
	  	if current_user == @category.manager or @category.users.include? current_user
	  		return true
	  	else
	  		redirect_to @category, alert: 'You are not allowed to access this page.'
	  	end
	  end
end
