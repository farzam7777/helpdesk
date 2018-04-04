class User < ApplicationRecord

	attribute :picture_url, :text

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :omniauth_providers => [:facebook, :google_oauth2, :linkedin]

  has_many :user_provider, :dependent => :destroy
end
