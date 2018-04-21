class Category < ApplicationRecord
  belongs_to :user
  has_many :services

  has_many :category_users, :dependent => :destroy
  has_many :users, through: :category_users

  scope :by_title, -> (title) { where("title LIKE ?", "%#{title}%") }

  def manager
  	user
  end

  def permission(user) 
  	category_users.find_by_user_id(user.id).permission
  end

  def permission_status(user)
  	if category_users.find_by_user_id(user.id).nil?
  		return false
  	else
  		return true
  	end
  end

  validates_uniqueness_of :title, message: 'There is already a Category with this title, Choose some other Title.'
end
