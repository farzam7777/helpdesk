Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations"}
  
	HighVoltage.configure do |config|
  	config.route_drawer = HighVoltage::RouteDrawers::Root
  end

  HighVoltage.configure do |config|
  	config.home_page = 'index'	
  end
end
