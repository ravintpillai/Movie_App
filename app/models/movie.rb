class Movie < ActiveRecord::Base
	validates :title, :description, :year_released, presence: true
end
