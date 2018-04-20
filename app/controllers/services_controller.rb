class ServicesController < ApplicationController
	has_scope :search_by, using: %i[title type], type: :hash

	def index
		user = params[:user]
		@category = Category.find(params[:category_id])

		if defined?(params[:search_by][:type]).nil?
			return redirect_to category_path(@category)
		end

		if params[:search_by][:type] == ''
			params[:search_by][:type] = '!@!@#%#$@@##!@#^%&'
		end

		if params[:search_by][:title] == ''
			params[:search_by][:title] = '!@!@#%#$@@##!@#^%&'
		end

		if user == 'no' || user.to_i != current_user.id
  		@services = apply_scopes(Service.where(status: 'public')).all
  		@user_status = false
  	else 
  		@services = apply_scopes(Service).all
  		@user_status = true
  	end
  		
  	@services = Kaminari.paginate_array(@services).page(params[:page]).per(2)
  	respond_to do |format|
      format.html {  }
      format.js
    end
  end

  def new
  	@service = Service.new
  	@category = Category.find(params[:category_id])
  end

  def create
  	@category = Category.find(params[:category_id])
  	@service = @category.services.build(service_params)
  	if @service.save
  		redirect_to category_service_path(@category, @service), notice: 'Service is successfully created'
  	else
  		render :new
  	end
  end

  def edit
  end

  def show
  	@category = Category.find(params[:category_id])
  	@service = Service.find(params[:id])
  end

  private

  	def service_params
	  	params.require(:service).permit!
	  end
end
