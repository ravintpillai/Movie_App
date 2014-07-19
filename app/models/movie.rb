class Movie < ActiveRecord::Base
	validates :title, :description, :release_year, presence: true
end
