class Vehicle < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('year DESC') }
	validates :name, presence: true
	validates :make, presence: true
	validates :model, presence: true
	validates :year, presence: true
	validates :user_id, presence: true
end
