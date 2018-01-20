class Question < ApplicationRecord
	acts_as_nested_set
	validates :title, presence: true

end
