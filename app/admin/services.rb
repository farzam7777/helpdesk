ActiveAdmin.register Service do
	permit_params :kind, :description, :pdf_needed, :category_id, :status, :title

	index do
	  selectable_column
	  column :title
	  column :kind
	  column 'Description' do |service|
      truncate(service.description, length: 15)
    end
	  column :pdf_needed, as: :boolean
	  column :category
	  column :status																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																												
	  actions
	end

	form multipart: true do |f|
	  f.inputs "Service Details" do
	  	f.input :category
	  	f.input :title																																																																																																																																																																																																																																																																																																																																																			
	  	f.input :kind
	  	f.input :pdf_needed, as: :select, collection: [['Yes', 1], ['No', 0]]
	  	f.input :status, as: :select, collection: [['Public', 'public'], ['Private', 'private']]
	  	f.input :description
	  end
	  f.button :Submit
	end
end
