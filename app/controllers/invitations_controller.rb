class InvitationsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]

	def new
  	@invitation = Invitation.new
  	@category = Category.find(params[:category_id])
  	respond_to do |format|
      format.html {  }
      format.js
    end
  end

	def create
		@user = current_user
		@email = params[:invitation][:email]
		@permission = params[:invitation][:permission]
		@category = Category.find(params[:category_id])
		@token = Digest::SHA1.hexdigest([Time.now, rand].join)

  	@invitation = Invitation.new(inviter_id: @user.id, email: @email, permission: @permission, category_id: @category.id, token: @token)
  	if @invitation.save
  		InvitationMailer.send_mail(@email, @user, @permission, @category, @token).deliver
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

	def accept
		@invitation = Invitation.find_by_token(params[:token])
		if @invitation.present?
			if User.all.map(&:email).include? @invitation.email
				@user = User.find_by_email(@invitation.email)
				CategoryUser.create(category_id: @invitation.category_id, user_id: @user.id, permission: @invitation.permission)

				redirect_to root_path, notice: 'You have been Successsfully Associated with Invited Category.' 
				@invitation.destroy
			else
				@password = SecureRandom.hex(3)
				@user = User.new(email: @invitation.email, password: @password, password_confirmation: @password)
				@user.confirmed_at = DateTime.now
				@user.save

				CategoryUser.create(category_id: @invitation.category_id, user_id: @user.id, permission: @invitation.permission)
				
				InvitationMailer.user_cred_mail(@user, @password).deliver

				@invitation.destroy
				redirect_to root_path, notice: 'Check your Email to get Valid Credentails to Login.'
			end
		else
			redirect_to root_path, alert: 'Invalid Token'
		end
	end

	private

		def invitation_params
			params.require(:invitation).permit!
		end
end
