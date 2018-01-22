class Question < ApplicationRecord
	acts_as_nested_set dependent: :nullify
	validates :title, presence: true
	belongs_to :user
end
