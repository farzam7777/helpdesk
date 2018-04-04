class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

    def google_oauth2
        @user = UserProvider.find_for_google_oauth(request.env["omniauth.auth"], session)
        if @user.persisted?
          sign_in_and_redirect @user, :event => :authentication
        else
          session["devise.user_attributes"] = user.attributes
          redirect_to new_user_registration_url
        end
    end

    def linkedin
        @user = UserProvider.find_for_linkedin_oauth(request.env["omniauth.auth"], session)
        if @user.persisted?
          sign_in_and_redirect @user, :event => :authentication
        else
          session["devise.user_attributes"] = user.attributes
          redirect_to new_user_registration_url
        end
    end

    def facebook
        @user = UserProvider.find_for_facebook_oauth(request.env["omniauth.auth"])

        if @user.persisted?
          sign_in_and_redirect @user, :event => :authentication               
        else
          session["devise.facebook_data"] = request.env["omniauth.auth"]
          redirect_to new_user_registration_url
        end
    end
end