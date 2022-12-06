class Song < ApplicationRecord
  belongs_to :project

  validates :url, presence: true, format: { with: /http[s]?:\/\/.+/, message: '不正なURLです!' }

  scope :by_project, ->(project_id) { where(project_id: project_id) }

  scope :recent_song, -> { order(updated_at: :desc).limit(1) }
end
