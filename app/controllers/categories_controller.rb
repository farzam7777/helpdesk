class CategoriesController < ApplicationController
 	before_action :authenticate_user!, only: [:new, :create, :edit]
 	before_action :check_role, only: [:new, :create, :edit]
 	has_scope :by_title

  def index
  	@categories = apply_scopes(Category).all
  	@categories = Kaminari.paginate_array(@categories).page(params[:page]).per(2)
  	respond_to do |format|
      format.html {  }
      format.js
    end
  end

  def new
  	@category = Category.new
  	respond_to do |format|
      format.html {  }
      format.js
    end
  end

  def create
  	@user = current_user
  	@category = Category.new(category_params)
    @category.user = current_user
  	if @category.save
  		respond_to do |format|
	      format.html { redirect_to categories_path, notice: 'Category is Successfully Saved.' }
	      format.js
	    end
  	else
  		respond_to do |format|
	      format.html { render :new }
	      format.js
	    end
  	end
  end

  def edit
    @category = Category.find(params[:id])
    puts "here"
    respond_to do |format|
      format.html { }
      format.js
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update category_params
      respond_to do |format|
        format.html { redirect_to categories_path, notice: 'Category Successfully Updated.' }
        format.js
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.js
      end
    end
  end

  def show
  	@category = Category.find(params[:id])
  	if current_user == @category.user or ( @category.users.include? current_user and @category.permission_status(current_user) and@category.permission(current_user) == "Manage" )
  		@services = @category.services
      @invitation = Invitation.new
  		@user_status = true
      @user_permission = true
  	elsif current_user == @category.user or ( @category.users.include? current_user and @category.permission_status(current_user) and@category.permission(current_user) == "Read" )
      @services = @category.services
      @invitation = Invitation.new
      @user_status = true
      @user_permission = false
    else
  		@services = @category.services.where(status: 'public')
  		@user_status = false
      @user_permission = false
  	end

    if @category.users.include? current_user
      @user_status = true
    end

  	@services = Kaminari.paginate_array(@services).page(params[:page]).per(2)
    @members = @category.users
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      respond_to do |format|
        format.html { redirect_to @category, notice: 'Category Successfully Deleted.' }
        format.js
      end
    end
  end

  private

  	def check_role
  		if current_user.role == "Buyer"
  			redirect_to categories_path, alert: 'You are not Allowed to Access this Page'
  		end
  	end

	  def category_params
	  	params.require(:category).permit!
	  end
end
