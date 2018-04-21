class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :omniauth_providers => [:facebook, :google_oauth2, :linkedin]

  has_many :user_provider, :dependent => :destroy

  has_many :category_users, :dependent => :destroy
  has_many :categories, through: :category_users

  scope :google_users, ->  { joins(:user_provider).where('user_providers.provider = ?', 'google_oauth2') }
  scope :facebook_users, ->  { joins(:user_provider).where('user_providers.provider = ?', 'facebook') }
  scope :linked_users, ->  { joins(:user_provider).where('user_providers.provider = ?', 'linkedin') }
	scope :site_users, ->  { left_outer_joins(:user_provider).where('user_providers.provider is null') }
end
