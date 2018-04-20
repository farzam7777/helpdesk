class Service < ApplicationRecord
	belongs_to :category

	scope :search_by, -> (title, type) { where("title LIKE ? OR kind LIKE ?", "%#{title}%", "%#{type}%") }

	validates :description, length: { minimum: 25 }
end
