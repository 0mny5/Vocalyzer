class Song < ApplicationRecord
  SONGS_LOWER_LIMIT = 2
  belongs_to :project
  has_one :chord
  accepts_nested_attributes_for :chord

  validates :url, presence: true
  # validate :analyze_cannot_be_less_than_one

  scope :by_project, ->(project_id) { where(project_id: project_id) }

  private

  def sanitize_url
    unless @song.url.match?(/https:\/\/www./)
      @song.url.prepend('https://www.')              
    end
  end

  def analyze_cannot_be_less_than_one
    if project.songs.count < SONGS_LOWER_LIMIT
      errors.add(:url, '少なくとも2曲以上の登録が必要です!')
    end
  end

end
