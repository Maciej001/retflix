# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  year        :integer
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Movie < ActiveRecord::Base
	validates :title, :description, :year, presence: true
	validates :description, length: { minimum: 10 }
	validates :year, numericality: { only_integer: true, greater_than: 0 }


	def to_s
		title
	end

	def self.search_for(query)
		where('title LIKE :query OR description LIKE :query',
					query: "%#{query}%")
	end
	
end
