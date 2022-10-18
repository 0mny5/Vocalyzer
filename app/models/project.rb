class Project < ApplicationRecord
  has_many :songs, inverse_of: :project, dependent: :destroy
  accepts_nested_attributes_for :songs, allow_destroy: true

  validates :title, presence: true
end
