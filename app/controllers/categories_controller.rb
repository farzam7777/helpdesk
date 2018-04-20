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
  	@category = @user.categories.build(category_params)
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
  end

  def show
  	@category = Category.find(params[:id])
  	if current_user == @category.user
  		@services = @category.services
  		@user_status = true
  	else
  		@services = @category.services.where(status: 'public')
  		@user_status = false
  	end
  	@services = Kaminari.paginate_array(@services).page(params[:page]).per(2)
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
