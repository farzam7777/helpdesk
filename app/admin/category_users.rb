ActiveAdmin.register CategoryUser do
	permit_params :category_id, :user_id, :permission

	form multipart: true do |f|
	  f.inputs "Category User Details" do
	  	f.input :category
	  	f.input :user																																																																																																																																																																																																																																																																																																																																																			
	  	f.input :permission, as: :select, collection: ['Manage', 'Read']
	  end
	  f.button :Submit
	end
end
