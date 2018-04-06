ActiveAdmin.register User do
	permit_params :email, :password, :password_confirmation, :username

	scope :google_users
	scope :facebook_users
	scope :linked_users
	scope :site_users

	index do
	  selectable_column
	  column :id
	  column :email
	  column :username
	  actions
	end

	form multipart: true do |f|
	  f.inputs "User Details" do
	  	f.input :email
	  	f.input :username
	  	if f.object.id.nil?
        f.inputs "Password" do
	        f.input :password,              :label => "Password"
	        f.input :password_confirmation, :label => "Password Confirmation"
      	end
    	end
	  end
	  f.button :Submit
	end

	filter :email
	filter :username

end
