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
  end

  def create
  	@user = current_user
  	@category = @user.categories.build(category_params)
  	if @category.save
			redirect_to categories_path, notice: 'Category is Successfully Saved.'
  	else
  		render :new
  	end
  end

  def edit
  end

  def show
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
