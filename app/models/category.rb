class Category < ApplicationRecord
  belongs_to :user
  has_many :services

  scope :by_title, -> (title) { where("title LIKE ?", "%#{title}%") }

  validates_uniqueness_of :title, message: 'There is already a Category with this title, Choose some other Title.'
end
