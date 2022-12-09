class Song < ApplicationRecord
  belongs_to :project

  validates :url, presence: true, format: { with: /\Ahttp[s]?:\/\/.+/, message: 'が不正です' }

  scope :by_project, ->(project_id) { where(project_id: project_id) }

  scope :recent_song, -> { order(updated_at: :desc).limit(1) }
end
